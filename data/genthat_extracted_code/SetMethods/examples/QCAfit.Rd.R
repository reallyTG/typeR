library(SetMethods)


### Name: QCAfit
### Title: Function calculating the parameters of fit
### Aliases: QCAfit

### ** Examples

# Generate fake data
set.seed(1234)

a <- runif(100, 0, 1)
b <- runif(100, 0, 1)
c <- runif(100, 0, 1)
y <- runif(100, 0, 1)

# Only one condition, for necessity
QCAfit(a, y, cond.lab = "A")

# With three conditions and their negation, for necessity
QCAfit(cbind(a, b, c), y)

# Only one condition, for sufficiency
QCAfit(a, y, cond.lab = "A", necessity = FALSE)

# With three conditions, their negation and negated output, for necessity
QCAfit(cbind(a, b, c), y, neg.out = TRUE)

# Load the Schneider data:

data(SCHF)

# Get parameters of fit for condition EMP as necessary for outcome EXPORT:

QCAfit(SCHF$EMP, SCHF$EXPORT, cond.lab = "EMP")

# Get parameters of fit for condition ~EMP as necessary for outcome ~EXPORT:

QCAfit(1-SCHF$EMP, SCHF$EXPORT, neg.out=TRUE, cond.lab = "~EMP")

# Get parameters of fit for all conditions and their negation as necessary for outcome EXPORT:

QCAfit(SCHF[,1:6], SCHF$EXPORT)

# Obtain the parsimonious solution for outcome "EXPORT":

sol_yp <- minimize(SCHF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE)
                
# Get parameters of fit for the parsimonious solution:

QCAfit(x = sol_yp, y = "EXPORT", necessity = FALSE)

# Get parameters of fit for truth table rows 2,8, and 10:

QCAfit(x = sol_yp, y = "EXPORT", ttrows=c("2","8","10"), necessity = FALSE)




