library(rvg)


### Name: body_add_vg
### Title: add a plot output as vector graphics into a Word object
### Aliases: body_add_vg

### ** Examples

## No test: 
library(officer)
x <- read_docx()
x <- body_add_vg(x, code = barplot(1:5, col = 2:6) )
print(x, target = "vg.docx")
## End(No test)



