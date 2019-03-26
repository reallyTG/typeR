# Basic data for testing
data <- data.frame(x = c(1, 0, 1), 
                   y = c(0, 1, 1))
priors <- c(Normal(0,1), 
            Normal(0,1))

p <- prefEl(data = data, priors = priors)

p$addPref(prefeR::`%>%`(1,3))

p$addPref(prefeR::`%>%`(2,3))

expect_equal(p$suggest(), c(2,1))