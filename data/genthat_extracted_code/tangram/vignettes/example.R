## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(tangram)
data(pbc)

## ----pbc, comment=""-----------------------------------------------------
tangram("drug ~ bili + albumin + stage::Categorical + protime + sex + age + spiders", pbc)

## ---- results="asis"-----------------------------------------------------
#rmd(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", pbc))

## ---- results="asis"-----------------------------------------------------
html5(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", pbc, msd=TRUE, quant=seq(0, 1, 0.25)),
      fragment=TRUE, inline="hmisc.css", caption = "HTML5 Table Hmisc Style", id="tbl2")

## ---- results="asis"-----------------------------------------------------
html5(tangram("drug ~ bili[2] + albumin + stage::Categorical + protime + sex + age + spiders", pbc),
      fragment=TRUE, inline="nejm.css", caption = "HTML5 Table NEJM Style", id="tbl3")

## ---- results="asis"-----------------------------------------------------

tbl <- tangram("drug ~ bili[2] + albumin + stage::Categorical[1] + protime + sex[1] + age + spiders[1]", 
              data=pbc,
              pformat = 5)
html5(tbl,
      fragment=TRUE,
      inline="lancet.css",
      caption = "HTML5 Table Lancet Style", id="tbl4"
      )

## ---- comment=""---------------------------------------------------------
index(tangram("drug ~ bili + albumin + stage::Categorical + protime + sex + age + spiders", pbc))[1:20,]

## ---- results='asis'-----------------------------------------------------
x <- round(rnorm(375, 79, 10))
y <- round(rnorm(375, 80,  9))
y[rbinom(375, 1, prob=0.05)] <- NA
attr(x, "label") <- "Global score, 3m"
attr(y, "label") <- "Global score, 12m"
html5(tangram(1 ~ x+y,
                    data.frame(x=x, y=y),
                    after=hmisc_intercept_cleanup),
      fragment=TRUE, inline="lancet.css", caption="", id="tbl5")

## ---- results='asis'-----------------------------------------------------
d1 <- iris
d1$A <- d1$Sepal.Length > 5.1
attr(d1$A,"label") <- "Sepal Length > 5.1"
tbl1 <- tangram(
 Species + 1 ~ A + Sepal.Width,
 data = d1,
 after = list(drop_statistics, function(tbl) del_col(tbl, 6))
 )

html5(tbl1,
     fragment=TRUE, inline="nejm.css", caption = "Example All Summary", id="tbl1")

## ----extension, comment=""-----------------------------------------------

### Make up some data, which has events nested within an id
n  <- 1000
df <- data.frame(id = sample(1:250, n*3, replace=TRUE), event = as.factor(rep(c("A", "B","C"), n)))
attr(df$id, "label") <- "ID"

### Now create custom function for counting events with a category
summarize_count <- function(table, row, column)
{
  ### Getting Data for row column ast nodes, assuming no factors
  datar <- row$data
  datac <- column$data

  ### Grabbing categories
  col_categories <- levels(datac)

  n_labels <- lapply(col_categories, FUN=function(cat_name){
    x <- datar[datac == cat_name]
    cell_n(length(unique(x)), subcol=cat_name)
  })

  # Test a poisson model
  test <- aov(glm(x ~ treatment,
                  aggregate(datar, by=list(id=datar, treatment=datac), FUN=length),
                  family=poisson))
  # Build the table
  table                                              %>%
  # Create Headers
  row_header(derive_label(row))                      %>%
  col_header("N", col_categories, "Test Statistic")  %>%
  col_header("",  n_labels,       ""              )  %>%
  # Add the First column of summary data as an N value
  add_col(cell_n(length(unique(datar))))             %>%
  # Now add quantiles for the counts
  table_builder_apply(col_categories, FUN=
    function(tbl, cat_name) {
      # Compute each data set
      x  <- datar[datac == cat_name]
      xx <- aggregate(x, by=list(x), FUN=length)$x

      # Add a column that is a quantile
      add_col(tbl, cell_iqr(xx, row$format, na.rm=TRUE))
  })                                                 %>%
  # Now add a statistical test for the final column
  add_col(test)
}

tangram(event ~ id["%1.0f"], df, summarize_count)

