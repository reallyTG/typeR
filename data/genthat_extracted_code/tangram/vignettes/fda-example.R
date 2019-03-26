## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(tangram)
library(Hmisc)



## ---- echo="TRUE"--------------------------------------------------------
# Make up some data
N    <- 10000
d1   <- data.frame(
  id        = 1:N,
  procedure = sample(c("A","B","C","D","E","F","G",NA),
                     N,
                     replace=TRUE,
                     prob=c(rep(0.14,7), 0.02)),
  category  = sample(c("D","E", NA),     N, replace=TRUE, prob=c(0.49, 0.49, 0.02)),
  prior     = pmin(rpois(N, 1), 5),
  modality  = sample(c("X","Y","Z", NA), N, replace=TRUE, prob=c(0.33, 0.33, 0.33, 0.01)),
  albumin   = rnorm(N, 3.5, 0.4)
) 

map_procedure_cat <- c(
  "Incisional", 
  "Parastomal", 
  "Incisional and Parastomal", 
  "Epigastric (primary hernia)", 
  "Umbilical (primary hernia)", 
  "Spigelian (primary hernia)", 
  "Lumbar (primary hernia)"
)

d1$prior            <- factor(d1$prior, levels=0:5, labels=c("0", "1", "2", "3", "4", "5+"))

d1$procedure        <- factor(d1$procedure, labels=map_procedure_cat)
label(d1$prior)     <- "Number of prior hernia repairs (among recurrent)"
label(d1$category)  <- "Primary or recurrent"
label(d1$procedure) <- "Ventral hernia procedure"

d1$albumin[sample(1:N,100)] <- NA
label(d1$albumin)   <- "Albumin"
units(d1$albumin)   <- "g/dL"


# Add a binary coded side effect variable
d1$side_effect     <- sample(c(TRUE, FALSE, NA), N, replace=TRUE, prob=c(0.49, 0.49, 0.02))
d1$reported_side_effects <- sample(1:256, N, replace=TRUE)
d1$reported_side_effects[!d1$side_effect] <- NA
label(d1$reported_side_effects) <- "Reported Side Effects"


## ---- echo="TRUE"--------------------------------------------------------
chiTests <- function(grid)
{
  lapply(2:dim(grid)[2], FUN=function(i){
    consider <- grid[,c(1, i)]
    if(min(consider) >= 1)
    {
      test   <- suppressWarnings(chisq.test(consider, correct=FALSE))
      stat   <- unname(test$statistic) * (sum(consider)-1) / sum(consider)
      cell(render_f(pchisq(stat, test$parameter, lower.tail=FALSE), 3), reference=1)
    }
    else
    {
      cell(render_f(fisher.test(consider, simulate.p.value=TRUE, B=1e7)$p.value, 3), reference=2)
    }
  })
}

## ---- echo="TRUE"--------------------------------------------------------
fda_cat_by_cat <- function(tb, row, col, display_percent=TRUE, ...)
{
  grid   <- table(row$data, col$data)
  
  tests  <- chiTests(grid)
  colN   <- lapply(colnames(grid), function(cat) cell_n(sum(grid[,cat]), subcol=cat))
  rowlbl <- lapply(rownames(grid), function(x) paste("  ", x))
  versus <- paste(colnames(grid)[1], "vs.", colnames(grid)[2:length(colnames(grid))])

  # Now construct the table by add rows to each column
  tb <- col_header(tb, colnames(grid), versus, "Missing")
  tb <- col_header(tb, colN, rep("P-value", length(versus)), "")
  tb <- row_header(tb, derive_label(row))
  
  for(nm in rowlbl) tb <- row_header(tb, nm)
  
  for(colnm in colnames(grid))
  {
    denom <- sum(grid[,colnm])
    tb <- add_row(tb, "")

    for(rownm in rownames(grid))
    {
      numer <- grid[rownm, colnm]
      x     <- if(display_percent) paste0(numer, " (", render_f(100*numer/denom, 1), ")") else
                                   as.character(numer)
        
      tb    <- add_row(tb, cell(x, subcol = colnm, subrow = rownm))
    }
    
    tb <- new_col(tb)
  }
  
  tb <- add_col(tb, tests)
  tb <- add_col(tb, length(row$data)-sum(grid))
}

## ---- results="asis"-----------------------------------------------------
tbl1 <- tangram("modality ~ procedure + category + prior", d1, transforms=fda_cat_by_cat)
html5(tbl1, fragment=TRUE, inline="nejm.css", caption = "FDA Table 1", id="tbl1")

## ---- echo=TRUE----------------------------------------------------------
wilcoxTests <- function(x, y)
{
  lvls <- levels(y)
  
  lapply(2:length(lvls), FUN=function(i){
    test <- wilcox.test(x[y==lvls[1]], x[y==lvls[i]])
    cell(render_f(test$p.value, 3), reference=3)
  })
}

## ---- echo=TRUE----------------------------------------------------------
fda_cont_by_cat <- function(tb, row, col, ...)
{
  datar          <- row$data
  datac          <- col$data
  
  lvls           <- levels(datac)

  colN   <- lapply(lvls, function(cat)
    cell_n(length(datac[datac == cat & !is.na(datac)]), subcol=cat))
  versus <- paste(lvls[1], "vs.", lvls[2:length(lvls)])

  # Now construct the table by add rows to each column
  tb <- col_header(tb, lvls, versus, "Missing")
  tb <- col_header(tb, colN, rep("P-value", length(versus)), "")
  tb <- row_header(tb, derive_label(row))
  
  for(nm in c("Mean", "Median", "SD")) tb <- row_header(tb, paste0("  ",nm))
  
  # Summary
  for(colnm in lvls)
  {
    d     <- datar[datac == colnm & !is.na(datac)]
    tb    <- add_row(tb, "")
    tb    <- add_row(tb, render_f(mean(d, na.rm=TRUE),   row$format))
    tb    <- add_row(tb, render_f(median(d, na.rm=TRUE), row$format))
    tb    <- add_row(tb, render_f(sd(d, na.rm=TRUE),     row$format))
    
    tb    <- new_col(tb)
  }
  
  # Tests
  tests <- wilcoxTests(datar, datac)
  tb <- add_col(tb, tests)
  tb <- add_col(tb, length(datar)-sum(!is.na(datar) & !is.na(datac)))
  
  tb
}

## ---- echo=TRUE----------------------------------------------------------
unsupported <- function(tb, row, col) stop("unsupported type", row$value, "X", col$value)
fda <- list(
  Type = hmisc_data_type,
  Numerical   = list(
                  Numerical   = unsupported,
                  Categorical = fda_cont_by_cat
            ),
  Categorical = list(
                  Numerical   = unsupported,
                  Categorical = fda_cat_by_cat
            ),
  Footnote    = "Count (Percent) format. ^1^ χ^2^ minus one. ^2^ Fisher exact. ^3^ Wilcoxon rank sum"
)


## ---- results="asis"-----------------------------------------------------
tbl2 <- tangram(modality ~ procedure + category + prior + albumin, d1, transforms=fda)
html5(tbl2, fragment=TRUE, inline="nejm.css", caption = "FDA Table 2", id="tbl2")

## ---- echo="TRUE"--------------------------------------------------------
side_effect_key = list(
  "Repetative Uttering of Wut?",
  "Excessive Sweating",
  "Hairy Navel",
  "Breaking Voice",
  "Beiber Fever",
  "Swiftaphila",
  "Akward Elbows",
  "Veruca"
)

fda_binary <- function(tb, row, col, binary_key=list(), ...)
{
  inside    <- row$right$data   # Grouped inside the right hand side of '*' assuming logical
  inside[is.na(inside)] <- FALSE
  datar     <- row$left$data[inside]  # Data to further group
  datac     <- col$data[inside]
  
  # Expand for counting
  x         <- rep(datar, each=length(binary_key))
  y         <- rep(datac, each=length(binary_key))
  key       <- rep(1:length(binary_key), length(datar))
  present   <- bitwAnd(x, 2^(key-1)) > 0
  
  # Filter down
  x         <- factor(sapply(key[present], function(x) binary_key[[x]]))
  y         <- y[present]
  
  rname     <- paste0(row$left$name(), " N=", sum(inside))

  fda_cat_by_cat(tb, list(data=x, name=function() rname), list(data=y, name=col$name),
                 display_percent=FALSE)
}

fda_data_type <- function(x, category_threshold=NA)
{ 
  if(is.categorical(x,category_threshold))  "Categorical" else
  if(is.numeric(x))                         "Numerical"   else
  stop(paste("Unsupported class/type - ",class(x), typeof(x)))
}

# Note the second dimension isn't present, it only determines function call by type of Row
# If provided a list of types to functions for each argument a cross product of types
# determines the functional transform. But this is a nice short cut provided.
fda <- list(
  Type        = fda_data_type,
  Numerical   = fda_cont_by_cat,
  Categorical = fda_cat_by_cat,
  ASTMultiply = fda_binary,
  Footnote    = "Count (Percent) format. ^1^ χ^2^ minus one. ^2^ Fisher exact. ^3^ Wilcoxon rank sum"
)

## ---- results="asis"-----------------------------------------------------
tbl3 <- tangram(modality ~ procedure + category + prior + albumin + reported_side_effects*side_effect, d1, transforms=fda,  binary_key=side_effect_key)
html5(tbl3, fragment=TRUE, inline="nejm.css", caption = "FDA Table 3", id="tbl3")

## ---- results="asis"-----------------------------------------------------

  ###############################################################
 # Statistical tests as table cells
#
chiTests <- function(grid)
{
  lapply(2:dim(grid)[2], FUN=function(i){
    consider <- grid[,c(1, i)]
    if(min(consider) >= 1)
    {
      test   <- suppressWarnings(chisq.test(consider, correct=FALSE))
      stat   <- unname(test$statistic) * (sum(consider)-1) / sum(consider)
      cell(render_f(pchisq(stat, test$parameter, lower.tail=FALSE), 3), reference=1)
    }
    else
    {
      cell(render_f(fisher.test(consider, simulate.p.value=TRUE, B=1e7)$p.value, 3), reference=2)
    }
  })
}

wilcoxTests <- function(x, y)
{
  lvls <- levels(y)
  
  lapply(2:length(lvls), FUN=function(i){
    test <- wilcox.test(x[y==lvls[1]], x[y==lvls[i]])
    cell(render_f(test$p.value, 3), reference=3)
  })
}

  ###############################################################
 # Row/Column from abstract syntax tree transforms to tables
#
fda_cat_by_cat <- function(tb, row, col, display_percent=TRUE, ...)
{
  grid   <- table(row$data, col$data)
  
  tests  <- chiTests(grid)
  colN   <- lapply(colnames(grid), function(cat) cell_n(sum(grid[,cat]), subcol=cat))
  rowlbl <- lapply(rownames(grid), function(x) paste("  ", x))
  versus <- paste(colnames(grid)[1], "vs.", colnames(grid)[2:length(colnames(grid))])

  # Now construct the table by add rows to each column
  tb <- col_header(tb, colnames(grid), versus, "Missing")
  tb <- col_header(tb, colN, rep("P-value", length(versus)), "")
  tb <- row_header(tb, derive_label(row))
  
  for(nm in rowlbl) tb <- row_header(tb, nm)
  
  for(colnm in colnames(grid))
  {
    denom <- sum(grid[,colnm])
    tb <- add_row(tb, "")

    for(rownm in rownames(grid))
    {
      numer <- grid[rownm, colnm]
      x     <- if(display_percent) paste0(numer, " (", render_f(100*numer/denom, 1), ")") else
                                   as.character(numer)
        
      tb    <- add_row(tb, cell(x, subcol = colnm, subrow = rownm))
    }
    
    tb <- new_col(tb)
  }
  
  tb <- add_col(tb, tests)
  tb <- add_col(tb, length(row$data)-sum(grid))
}

fda_cont_by_cat <- function(tb, row, col, ...)
{
  datar          <- row$data
  datac          <- col$data
  
  lvls           <- levels(datac)

  colN   <- lapply(lvls, function(cat)
    cell_n(length(datac[datac == cat & !is.na(datac)]), subcol=cat))
  versus <- paste(lvls[1], "vs.", lvls[2:length(lvls)])

  # Now construct the table by add rows to each column
  tb <- col_header(tb, lvls, versus, "Missing")
  tb <- col_header(tb, colN, rep("P-value", length(versus)), "")
  tb <- row_header(tb, derive_label(row))
  
  for(nm in c("Mean", "Median", "SD")) tb <- row_header(tb, paste0("  ",nm))
  
  # Summary
  for(colnm in lvls)
  {
    d     <- datar[datac == colnm & !is.na(datac)]
    tb    <- add_row(tb, "")
    tb    <- add_row(tb, render_f(mean(d, na.rm=TRUE),   row$format))
    tb    <- add_row(tb, render_f(median(d, na.rm=TRUE), row$format))
    tb    <- add_row(tb, render_f(sd(d, na.rm=TRUE),     row$format))
    
    tb    <- new_col(tb)
  }
  
  # Tests
  tests <- wilcoxTests(datar, datac)
  tb <- add_col(tb, tests)
  tb <- add_col(tb, length(datar)-sum(!is.na(datar) & !is.na(datac)))
  
  tb
}

fda_binary <- function(tb, row, col, binary_key=list(), ...)
{
  inside    <- row$right$data   # Grouped inside the right hand side of '*' assuming logical
  inside[is.na(inside)] <- FALSE
  datar     <- row$left$data[inside]  # Data to further group
  datac     <- col$data[inside]
  
  # Expand for counting
  x         <- rep(datar, each=length(binary_key))
  y         <- rep(datac, each=length(binary_key))
  key       <- rep(1:length(binary_key), length(datar))
  present   <- bitwAnd(x, 2^(key-1)) > 0
  
  # Filter down
  x         <- factor(sapply(key[present], function(x) binary_key[[x]]))
  y         <- y[present]
  
  rname     <- paste0(row$left$name(), " N=", sum(inside))

  fda_cat_by_cat(tb, list(data=x, name=function() rname), list(data=y, name=col$name),
                 display_percent=FALSE)
}

  ###############################################################
 # Data typing function to use with above
#
fda_data_type <- function(x, category_threshold=NA)
{ 
  if(is.categorical(x,category_threshold))  "Categorical" else
  if(is.numeric(x))                         "Numerical"   else
  stop(paste("Unsupported class/type - ",class(x), typeof(x)))
}

  ###############################################################
 #
# Bring it all together into a useable bundle of transforms
fda <- list(
  Type        = fda_data_type,
  Numerical   = fda_cont_by_cat,
  Categorical = fda_cat_by_cat,
  ASTMultiply = fda_binary,
  Footnote    = "Count (Percent) format. ^1^ χ^2^ minus one. ^2^ Fisher exact. ^3^ Wilcoxon rank sum"
)


