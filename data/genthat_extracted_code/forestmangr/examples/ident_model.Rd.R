library(forestmangr)


### Name: ident_model
### Title: Identity of a Model Test
### Aliases: ident_model

### ** Examples

library(forestmangr)
data("exfm13")
exfm13

# The objective is to know if the diameter's behavior is similar among 3 species.
# For this we'll use a quadratic model. We'll use nitrogen (N) as our X variable.

ident_model(exfm13, "species", dbh ~ N + N2)

# This test shows that there are differences between the species. 
# We can get more details on this using a different output, that will also
# give us a plot:

ident_model(exfm13, "species", dbh ~  N + N2, output = "table_plot")

# This gives us only the plot:
ident_model(exfm13, "species", dbh ~  N + N2, output = "table_plot")

# And this gives us additional information on the test:
ident_model(exfm13, "species", dbh ~  N + N2, output = "full")

# Looking at the plot, it seems that 2 species are behaving very similar, while
# the Pequi species is different from the other 2. We can confirm this by running
# the test in a paired fashion, using the filter argument:

ident_model(exfm13, "species", dbh ~  N + N2,
 filter = c("PEQUI", "SUCUPIRA-PRETA"), output = "table_plot")
 
ident_model(exfm13, "species", dbh ~  N + N2, 
filter = c("PEQUI", "VINHATICO"), output = "table_plot")

ident_model(exfm13, "species", dbh ~  N + N2, 
filter = c("SUCUPIRA-PRETA", "PEQUI"), output = "table_plot")

ident_model(exfm13, "species", dbh ~  N + N2, 
filter = c("SUCUPIRA-PRETA", "VINHATICO"), output = "table_plot")

# As we imagined, a single model can be used to describe the behavior of
# the "Sucupira-preta" and "Vinhatico" species,
# and a second model is needed to explain the Pequi Variable.

# It's possible to apply a color scale to the plots, and also change it's font to arial:

ident_model(exfm13, "species", dbh ~  N + N2,output="plot",gray_scale=FALSE,font="sans")




