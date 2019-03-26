library(OptM)


### Name: plot_optM
### Title: plot_optM function
### Aliases: plot_optM
### Keywords: plot_optM

### ** Examples

# Load a folder of simulated test data for m = 3
folder <- system.file("extdata", package = "OptM")
# Run the Evanno method and plot the results
test.optM = optM(folder)
plot_optM(test.optM, method = "Evanno")

# To view the various linear modeling estimates and plot:
   # test.linear = optM(folder, method = "linear")
   # plot_optM(test.linear, method = "linear")

# To view the results from the SiZer package:
   # test.sizer = optM(folder, method = "SiZer")
   # plot_optM(test.sizer, method = "SiZer")



