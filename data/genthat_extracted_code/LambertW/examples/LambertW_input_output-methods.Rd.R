library(LambertW)


### Name: LambertW_input_output-methods
### Title: Methods for Lambert W input and output objects
### Aliases: LambertW_input_output-methods plot.LambertW_input
###   plot.LambertW_output print.LambertW_input print.LambertW_output
### Keywords: hplot print

### ** Examples


# create a Normal(1, 2) input
Gauss.input <- create_LambertW_input("normal", beta = c(1, 2))
plot(Gauss.input)
# make it a bit heavy tailed (beta in theta comes from Gauss.input)
LW.Gauss <- create_LambertW_output(LambertW.input = Gauss.input, 
                                   theta = list(delta = c(0.3)))
LW.Gauss  # print a nice overview in the console
plot(LW.Gauss)

# draw random sample
LW.Gauss$r(n=10)
Gauss.input$r(n=10)
# quantiles
LW.Gauss$q(p=0.6)
Gauss.input$q(p=0.6)




