library(fabricatr)


### Name: correlate
### Title: Perform generation of a correlated random variable.
### Aliases: correlate

### ** Examples


# Generate a variable of interest
exam_score <- pmin(100, rnorm(n = 100, mean = 80, sd = 10))

# Generate a correlated variable using fabricatr variable generation
scholarship_offers <- correlate(given = exam_score, rho = 0.7,
                                draw_count, mean = 3)

# Generate a correlated variable using base R distributions
final_grade <- pmax(100, correlate(given = exam_score, rho = 0.7,
                                   rnorm, mean = 80, sd = 10))




