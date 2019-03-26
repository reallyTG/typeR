library(gamCopula)


### Name: gamVineCopSelect
### Title: Sequential pair-copula selection and maximum penalized
###   likelihood estimation of a GAM-Vine model.
### Aliases: gamVineCopSelect

### ** Examples

require(mgcv)
set.seed(0)

##  Simulation parameters
# Sample size
n <- 1e3
# Copula families
familyset <- c(1:2,301:304,401:404)
# Define a 4-dimensional R-vine tree structure matrix
d <- 4
Matrix <- c(2,3,4,1,0,3,4,1,0,0,4,1,0,0,0,1)
Matrix <- matrix(Matrix,d,d)
nnames <- paste("X", 1:d, sep = "")

## A function factory
eta0 <- 1
calib.surf <- list(
  calib.quad <- function(t, Ti = 0, Tf = 1, b = 8) {
    Tm <- (Tf - Ti)/2
    a <- -(b/3) * (Tf^2 - 3 * Tf * Tm + 3 * Tm^2)
    return(a + b * (t - Tm)^2)},
  calib.sin <- function(t, Ti = 0, Tf = 1, b = 1, f = 1) {
    a <- b * (1 - 2 * Tf * pi/(f * Tf * pi +
                                 cos(2 * f * pi * (Tf - Ti))
                               - cos(2 * f * pi * Ti)))
    return((a + b)/2 + (b - a) * sin(2 * f * pi * (t - Ti))/2)},
  calib.exp <- function(t, Ti = 0, Tf = 1, b = 2, s = Tf/8) {
    Tm <- (Tf - Ti)/2
    a <- (b * s * sqrt(2 * pi)/Tf) * (pnorm(0, Tm, s) - pnorm(Tf, Tm, s))
    return(a + b * exp(-(t - Tm)^2/(2 * s^2)))})

##  Create the model
# Define gam-vine model list
count <- 1
model <- vector(mode = "list", length = d*(d-1)/2)
sel <- seq(d,d^2-d, by = d)

# First tree
for (i in 1:(d-1)) {
  # Select a copula family
  family <- sample(familyset, 1)
  model[[count]]$family <- family
  
  # Use the canonical link and a randomly generated parameter 
  if (is.element(family,c(1,2))) {
    model[[count]]$par <- tanh(rnorm(1)/2)
    if (family == 2) {
      model[[count]]$par2 <- 2+exp(rnorm(1))
    }  
  } else {
    if (is.element(family,c(401:404))) {
      rr <- rnorm(1)
      model[[count]]$par <- sign(rr)*(1+abs(rr))
    } else {
      model[[count]]$par <- rnorm(1)
    }
    model[[count]]$par2 <- 0
  }
  count <- count + 1
}

# A dummy dataset
data <- data.frame(u1 = runif(1e2), u2 = runif(1e2), matrix(runif(1e2*d),1e2,d))

# Trees 2 to (d-1)
for(j in 2:(d-1)){
  for(i in 1:(d-j)){ 
    # Select a copula family
    family <- sample(familyset, 1)  
    
    # Select the conditiong set and create a model formula
    cond <- nnames[sort(Matrix[(d-j+2):d,i])]
    tmpform <- paste("~",paste(paste("s(", cond, ", k=10, bs='cr')",
                                     sep = ""), collapse=" + "))
    l <- length(cond)
    temp <- sample(3, l, replace = TRUE)
    
    # Spline approximation of the true function
    m <- 1e2
    x <- matrix(seq(0,1,length.out=m), nrow = m, ncol = 1)
    if(l != 1){  
      tmp.fct <- paste("function(x){eta0+",
                       paste(sapply(1:l, function(x) 
                         paste("calib.surf[[",temp[x],"]](x[",x,"])",
                               sep="")), collapse="+"),"}",sep="")
      tmp.fct <- eval(parse(text = tmp.fct))
      x <- eval(parse(text = paste0("expand.grid(",
                                   paste0(rep("x",l), collapse = ","),")", 
                                   collapse = "")))
      y <- apply(x,1,tmp.fct)
    }else{
      tmp.fct <- function(x) eta0+calib.surf[[temp]](x)  
      colnames(x) <- cond
      y <- tmp.fct(x)
    }
    
    # Estimate the gam model
    form <- as.formula(paste0("y", tmpform))
    dd <- data.frame(y, x)
    names(dd) <- c("y", cond)
    b <- gam(form, data = dd)
    #plot(x[,1],(y-fitted(b))/y)
    
    # Create a dummy gamBiCop object
    tmp <- gamBiCopFit(data = data, formula = form, family = 1, n.iters = 1)$res
    
    # Update the copula family and the model coefficients
    attr(tmp, "model")$coefficients <- coefficients(b)
    attr(tmp, "model")$smooth <- b$smooth
    attr(tmp, "family") <- family
    if (family == 2) {
      attr(tmp, "par2") <- 2+exp(rnorm(1))
    }
    model[[count]] <- tmp
    count <- count+1  
  } 
}

# Create the gamVineCopula object
GVC <- gamVine(Matrix=Matrix,model = model,names=nnames)
print(GVC)

## Not run: 
##D ## Simulate and fit the model
##D sim <- gamVineSimulate(n, GVC)
##D fitGVC <- gamVineSeqFit(sim, GVC, verbose = TRUE)
##D fitGVC2 <- gamVineCopSelect(sim, Matrix, verbose = TRUE)
##D 
##D ## Plot the results
##D par(mfrow=c(3,4))
##D plot(GVC, ylim = c(-2.5,2.5))
##D 
##D plot(fitGVC, ylim = c(-2.5,2.5))
##D 
##D plot(fitGVC2, ylim = c(-2.5,2.5))
## End(Not run)




