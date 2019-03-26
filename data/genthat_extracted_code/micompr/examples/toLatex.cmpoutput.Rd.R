library(micompr)


### Name: toLatex.cmpoutput
### Title: Convert 'cmpoutput' object to 'LaTeX' table
### Aliases: toLatex.cmpoutput

### ** Examples


# Create a cmpoutput object by comparing the first output ("Pop.Sheep") of
# one the provided datasets.
cmp <-
 cmpoutput("SheepPop", 0.9, pphpc_ok$data[["Pop.Sheep"]], pphpc_ok$obs_lvls)

# Print latex table source to screen
toLatex(cmp)




