## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  collapse = TRUE,
  comment = "#>", 
  eval = !is.null(knitr::opts_knit$get("rmarkdown.pandoc.to"))
)

## ----warning=FALSE, message=FALSE----------------------------------------
library(flextable)
library(officer)

## ----warning=FALSE, message=FALSE----------------------------------------
select_columns <- c("Species", "Petal.Length", "Petal.Width")
myft <- regulartable(iris[46:55,], col_keys = select_columns)
myft <- merge_v(myft, ~ Species + Petal.Width )
myft

## ----warning=FALSE, message=FALSE----------------------------------------
select_columns <- c("Species", "Petal.Length", "Petal.Width")
myft <- regulartable(head(mtcars, n = 10 ) )
myft <- merge_h(myft)
# and add borders
myft <- border(myft, border = fp_border(), part = "all") 
myft

## ----warning=FALSE, message=FALSE----------------------------------------
select_columns <- c("Species", "Petal.Length", "Petal.Width")
myft <- regulartable(head(mtcars, n = 6 ) )
myft <- merge_at( myft, i = 1:3, j = 1:3)
myft <- border(myft, border = fp_border(), part = "all")
myft

## ------------------------------------------------------------------------
merge_none(myft)

## ------------------------------------------------------------------------
data <- iris[c(1:3, 51:53, 101:104),]

myft <- regulartable(data, col_keys = c("Species", "Sepal.Length", "Petal.Length") )
myft

## ------------------------------------------------------------------------
myft <- regulartable(
  data = data, 
  col_keys = c("Species", "col_1", "Sepal.Length", "Petal.Length") )
myft <- theme_vanilla(myft)
myft <- autofit(myft)
myft <- empty_blanks(myft)
myft

## ----warning=FALSE, message=FALSE----------------------------------------
ft <- regulartable( head( iris ) ) 
ft <- set_header_labels(ft, Sepal.Length = "Sepal", 
    Sepal.Width = "Sepal", Petal.Length = "Petal",
    Petal.Width = "Petal", Species = "Species" )
ft <- theme_vanilla(ft)
ft <- autofit(ft)
ft

## ----warning=FALSE, message=FALSE----------------------------------------
ft <- add_header(ft, Sepal.Length = "length",
    Sepal.Width = "width", Petal.Length = "length",
    Petal.Width = "width", Species = "Species", top = FALSE ) 
ft <- theme_vanilla(ft)
ft <- autofit(ft)
ft
ft <- add_header(ft, Sepal.Length = "Inches",
    Sepal.Width = "Inches", Petal.Length = "Inches",
    Petal.Width = "Inches", Species = "Species", top = TRUE )

ft <- add_footer(ft, Sepal.Length = "* This is a note" )
ft <- color(ft, color = "orange", part = "footer" )

# merge identical cells
ft <- merge_h(ft, part = "header")
ft <- merge_v(ft, part = "header")
ft <- merge_at(ft, i = 1, j = 1:5, part = "footer")

ft <- theme_booktabs(ft)
ft

## ----warning=FALSE, message=FALSE----------------------------------------
typology <- data.frame(
  col_keys = c( "Sepal.Length", "Sepal.Width", "Petal.Length",
                "Petal.Width", "Species" ),
  type = c("double", "double", "double", "double", "factor"),
  what = c("Sepal", "Sepal", "Petal", "Petal", "Species"),
  measure = c("Length", "Width", "Length", "Width", "Species"),
  stringsAsFactors = FALSE )
autofit( theme_vanilla(flextable(typology)) )

## ----warning=FALSE, message=FALSE----------------------------------------
ft <- regulartable( head( iris ) )
ft <- set_header_df( ft, mapping = typology, key = "col_keys" )

ft <- merge_h(ft, part = "header")
ft <- merge_v(ft, part = "header")

ft <- theme_vanilla(ft)
ft <- autofit(ft)
ft

## ------------------------------------------------------------------------
ft_base <- regulartable(head(iris))
ft_base <- theme_tron_legacy(ft_base)
ft_base
dim(ft_base)

## ------------------------------------------------------------------------
dim_pretty(ft_base)

## ------------------------------------------------------------------------
ft <- autofit(ft_base, add_w = 0, add_h = 0)

dim(ft)
ft

## ------------------------------------------------------------------------
ft <- autofit(ft_base)
ft <- width(ft, j = ~ Species, width = 2)
ft <- height_all( ft, height = .4 )
ft <- height( ft, i = 3, height = 1 )
ft

