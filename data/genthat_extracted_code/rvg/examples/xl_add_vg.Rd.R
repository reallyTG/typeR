library(rvg)


### Name: xl_add_vg
### Title: add a plot output as vector graphics into an Excel object
### Aliases: xl_add_vg

### ** Examples

## No test: 
library(officer)
my_ws <- read_xlsx()
my_ws <- xl_add_vg(my_ws, sheet = "Feuil1",
  code = barplot(1:5, col = 2:6), width = 6, height = 6, left = 1, top = 2 )
print(my_ws, target = "vg.xlsx")
## End(No test)



