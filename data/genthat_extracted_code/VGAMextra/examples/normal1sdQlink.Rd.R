library(VGAMextra)


### Name: normal1sdQlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions.
### Aliases: normal1sdQlink

### ** Examples

    ###   Example 1  ###
    theta <- seq(0, 3, by = 0.1)[-1]  # This is sigma, then must be positive.
    mean  <- -2.5                     # Intentionally, a negative value for mu.
    p     <- 0.25                     # Modelling the first quartile.
    
    eta <- normal1sdQlink(theta = theta, p = p, mean = mean) 
    inv.eta <- normal1sdQlink(theta = eta, p = p, mean = mean, inverse = TRUE)
    summary(inv.eta - theta)          ## Should be 0

    
    ###  Example 2. Special values of theta, using argument 'bvalue'.  ###
    
    theta <- c(-Inf, -5, -2.5, 0, 2.5, 5, Inf, NA, NaN)
    my.matrix <- rbind(theta, normal1sdQlink(theta = theta, p = p, mean = mean),
                     normal1sdQlink(theta = theta, p = p, mean = mean, bvalue = 1e-5))
    rownames(my.matrix) <- c("theta", "No 'bvalue'", "With 'bvalue'")
    colnames(my.matrix) <- rep("", 9)
    
    my.matrix   # Second row has NAs, whilst third row has NO NAs except for theta = NA



