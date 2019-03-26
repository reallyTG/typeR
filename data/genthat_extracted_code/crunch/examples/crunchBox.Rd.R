library(crunch)


### Name: crunchBox
### Title: Make a CrunchBox
### Aliases: crunchBox CrunchBox

### ** Examples


## Not run: 
##D # Creating a CrunchBox with three variables
##D crunchBox(ds[c("var1", "var2", "var3")], title="New CrunchBox")
##D 
##D # Creating a CrunchBox changing primary, secondary, and message brand colors
##D crunchBox(ds[c("var1", "var2", "var3")],
##D           title="Branded CrunchBox",
##D           brand_colors = c("#ff0aa4", "#af17ff", "#260aff"))
##D 
##D # Creating a CrunchBox changing category-specific colors
##D crunchBox(ds[c("var1", "var2", "var3")],
##D           title="CrunchBox with category colors",
##D           category_color_lookup = list("agree" = "#ff0aa4",
##D                                        "disagree" = "#af17ff",
##D                                        "don't know" = "#260aff"))
## End(Not run)




