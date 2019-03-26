library(customLayout)


### Name: phl_with_flextable
### Title: add flextable into layout placeholder
### Aliases: phl_with_flextable

### ** Examples


library(officer)
lay <-  lay_new(matrix(1:4,nc=2),widths=c(3,2),heights=c(2,1))
lay2 <- lay_new(matrix(1:3))
lay3 <- lay_bind_col(lay,lay2, widths=c(3,1))
offLayout <- phl_layout(lay3)

pptx <- read_pptx()
pptx <- add_slide(
  pptx, 
  master = "Office Theme",
  layout = "Title and Content"
)

# add table to pptx file
x <- tail(iris, 10)[,c(1,5)]
xf <- phl_adjust_table(x, offLayout, 1)
pptx <- phl_with_flextable(pptx, offLayout, 1, xf)

x2 <- tail(iris, 10)[,c(1,5)]
xf2 <- phl_adjust_table(x, offLayout, 2)
pptx <- phl_with_flextable(pptx, offLayout, 2, xf2)

## Not run: 
##D file <- tempfile(fileext = ".pptx")
##D print(pptx, target = file)
## End(Not run)




