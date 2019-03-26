library(lime)


### Name: plot_text_explanations
### Title: Plot text explanations
### Aliases: plot_text_explanations

### ** Examples

# We load a precalculated explanation set based on the procedure in the ?lime
# examples
explanations <- readRDS(system.file('extdata', 'text_explanation.rds',
                                    package = 'lime'))

# We see that the explanations are in the expected format
print(explanations)

# We can now get the explanations in the context of the input text
plot_text_explanations(explanations)




