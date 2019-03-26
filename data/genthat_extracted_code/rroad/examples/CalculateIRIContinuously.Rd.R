library(rroad)


### Name: CalculateIRIContinuously
### Title: Computes the IRI for a continuously increasing segment given a
###   road profile
### Aliases: CalculateIRIContinuously

### ** Examples

generate_test_profile <- function (x) {
if (x < 1) return(0)
if (x >= 1 && x < 3) return(x - 1)
if (x >= 3 && x < 5) return(5 - x)
if (x >= 5) return(0)
}
x <- seq(.25, 30, by = .25)
test_profile <- data.frame(x = x, profile=sapply(x, generate_test_profile))
test_profile$iri <- CalculateIRIContinuously(
                      test_profile$profile, IRI_COEF_250)
plot(x = test_profile$x, y = test_profile$profile, ylim = c(0, 8),
     xlim = c(0,25), type = "l")
lines(x = test_profile$x, y = test_profile$iri*10)



