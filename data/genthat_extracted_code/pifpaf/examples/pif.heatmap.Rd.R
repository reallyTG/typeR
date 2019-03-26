library(pifpaf)


### Name: pif.heatmap
### Title: Graphical Sensitivity Analysis of Potential Impact Fraction's
###   Counterfactual
### Aliases: pif.heatmap

### ** Examples

## Not run: 
##D #Example 1
##D #------------------------------------------------------------------
##D X  <- data.frame(rnorm(25,3))            #Sample
##D rr <- function(X,theta){exp(X*theta)}    #Relative risk
##D theta <- 0.01                            #Estimate of theta
##D pif.heatmap(X, theta = theta, rr = rr)
##D 
##D #Save file using ggplot2
##D #require(ggplot2)
##D #ggsave("My Potential Impact Fraction Heatmap Analysis.pdf")
##D 
##D #Change pif estimation method to kernel
##D 
##D pif.heatmap(X, theta = theta, rr = rr, method = "kernel")
##D 
##D #Example 2
##D #------------------------------------------------------------------
##D X     <- data.frame(Exposure = rbeta(100, 1, 0.2))
##D theta <- c(0.12, 1)
##D rr    <- function(X,theta){X*theta[1] + theta[2]}
##D cft   <- function(X, a, b){sin(a*X)*b}
##D pif.heatmap(X, theta = theta, rr = rr, cft = cft, 
##D      nmesh = 15, colors = rainbow(30), method = "empirical",
##D      title = "PIF with counterfactual cft(X) = sin(a*X)*b")
##D 
##D #Change estimation method to approximate
##D Xmean <- data.frame(mean(X[,"Exposure"]))
##D Xvar  <- var(X)
##D pif.heatmap(Xmean, Xvar = Xvar, theta = theta, rr = rr, cft = cft, 
##D      nmesh = 15, colors = rainbow(30), method = "approximate",
##D      title = "PIF with counterfactual cft(X) = sin(a*X)*b")
##D 
##D 
##D #Example 3: Plot univariate counterfactuals
##D #------------------------------------------------------------------
##D X       <- data.frame(rgamma(100, 1, 0.2))
##D theta   <- c(0.12, 1)
##D rr      <- function(X,theta){X*theta[1] + theta[2]}
##D cft     <- function(X, a, b){sqrt(a*X)}   #Leave two variables in it
##D pifplot <- pif.heatmap(X, theta = theta, rr = rr, 
##D  cft = cft, mina = 0, maxa = 1, minb = 0, maxb = 0, 
##D  legendtitle = "Potential Impact Fraction",
##D  title ="Univariate counterfactual", ylab = "", colors = topo.colors(10))
##D pifplot
##D 
##D #You can also add additional ggplot objects
##D #require(ggplot2)
##D #pifplot + annotate("text", x = 0.25, y = 0.4, label = "10yr scenario") + 
##D #geom_vline(aes(xintercept = 0.5), linetype = "dashed") +
##D #geom_segment(aes(x = 0.25, y = 0.38, xend = 0.5, yend = 0.3), 
##D #arrow = arrow(length = unit(0.25, "cm")))
##D 
##D #Example 4: Plot counterfactual with categorical risks
##D #------------------------------------------------------------------
##D set.seed(18427)
##D X        <- data.frame(Exposure = 
##D               sample(c("Normal","Overweight","Obese"), 100, 
##D                       replace = TRUE, prob = c(0.4, 0.1, 0.5)))
##D thetahat <- c(1, 1.7, 2)
##D 
##D #Categorical relative risk function
##D rr <- function(X, theta){
##D 
##D    #Create return vector with default risk of 1
##D    r_risk <- rep(1, nrow(X))
##D    
##D    #Assign categorical relative risk
##D    r_risk[which(X[,"Exposure"] == "Normal")]      <- thetahat[1]
##D    r_risk[which(X[,"Exposure"] == "Overweight")]  <- thetahat[2]
##D    r_risk[which(X[,"Exposure"] == "Obese")]       <- thetahat[3]
##D    
##D    return(r_risk)
##D }
##D 
##D #Counterfactual of reducing a certain percent of obesity and overweight cases
##D #to normality
##D cft <- function(X, per.over, per.obese){
##D 
##D    #Find the overweight and obese individuals
##D    which_obese <- which(X[,"Exposure"] == "Obese")
##D    which_over  <- which(X[,"Exposure"] == "Overweight")
##D    
##D    #Reduce per.over % of overweight and per.obese % of obese
##D    X[sample(which_obese, length(which_obese)*per.obese),
##D        "Exposure"] <- "Normal"
##D    X[sample(which_over,  length(which_over)*per.over),
##D        "Exposure"] <- "Normal"
##D    
##D    return(X)
##D }
##D 
##D pif.heatmap(X, thetahat = thetahat, rr = rr, cft = cft, mina = 0, minb = 0, maxa = 1, 
##D             maxb = 1, title = "PIF of excess-weight reduction",
##D             xlab = "% Overweight cases", ylab = "% Obese cases",
##D             check_exposure = FALSE, check_rr = FALSE)
## End(Not run)



