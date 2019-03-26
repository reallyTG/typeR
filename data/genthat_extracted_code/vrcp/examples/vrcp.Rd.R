library(vrcp)


### Name: vrcp
### Title: Estimation for Varying Regression Segments and Change Point in
###   Heteroscedastic Data
### Aliases: vrcp

### ** Examples

library(ggplot2)

# Test the vrcp() using simulated data sets

# Example 1: L-L model with "c0", continuity at change point and common variance
# Simulate the data
x1<-seq(0,2,by=0.05)
x2<-seq(2.05,5,by=0.05)

# The true regression functions
yt1 <- 2+0.5*x1
yt2 <- -1+2*x2

# Add noises
y1<-yt1+rnorm(length(x1),0,0.25)
y2<- yt2+rnorm(length(x2),0,0.25)
z<-data.frame(c(x1,x2),c(y1,y2))
names(z)=c("x","y")

# z is the simulated data in data frame. Let's visualize it
plot(z)

# It looks like a L-L regression with a change point between 1.5 and 2.5
# Fit with vrcp with L-L segments and "c0" constraint
ans <- vrcp(z,1.5,2.5,"c0","L","L","Common", spline = "TRUE") # Fit with common variance
ans

# The fitted L-L regression and spline are superimposed on the data
# Let's compare it with the true regression
x<-z$x
yt<-c(yt1,yt2)
ans$plot + ggplot2::geom_line(aes(x = x, y = yt), color = c("blue"), size=1) +
ggtitle("LL-c0-com model: Estimates vs. true model (in blue)")

ans <- vrcp(z,1.5,2.5,"c0","L","L","Diff",spline = "TRUE") # Fit with different variance
ans
ans$plot + ggplot2::geom_line(aes(x = x, y = yt), color = "blue", size=1) +
ggtitle("LL-c0-diff model: Estimates vs. true model (in blue)") # compare


## Not run: 
##D # Example 2: L-Log model with "c1" change point and common variance.
##D # Simulate the data
##D x1<-seq(0.05,2.05,by=0.05)
##D x2<-seq(2.1,5.05,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 3+1*x1
##D yt2 <- 3.61+2*log(x2)
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,0.5)
##D y2<- yt2+rnorm(length(x2),0,0.5)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)<-c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a L-Log regression with a change point between 1.9 and 2.2
##D # Fit with vrcp with specification of L-Log segments and "c1" options with 
##D # and without common variance restriction
##D ans <- vrcp(z,1.9,2.2,"c1","L","Log","Common")
##D ans
##D 
##D # The fitted L-Log regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-c1-com model: Estimate (in magenta) vs. true model") # Fit with common variance
##D 
##D ans <- vrcp(z,1.9,2.5,"c1","L","Log","Diff") 
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-c1-diff model: Estimate (in magenta) vs. true model") # Fit with different variance
##D 
##D # both fits look good
##D 
##D # Check what would look like with misspecification of smoothness at change point
##D ans <- vrcp(z,1.9,2.2,"c0","L","Log","Common") # Fit with common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-c0-com fit to LLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"c0","L","Log","Diff") # Fit with different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-c0-diff fit to LLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D # both look lack of fit, especially at the change point. 
##D # Hence, the correct specification of model is important 
##D 
##D 
##D # Example 3: Log-L - Simulated data set is "c1", smooth.
##D # Simulate the data
##D x1<-seq(2,4,by=0.05)
##D x2<-seq(4,7,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 1.6+0.5*log(x1)
##D yt2 <- 1.89+0.1*x2
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,0.1)
##D y2<- yt2+rnorm(length(x2),0,0.1)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Log-L regression with a change point between 3.9 and 4.5
##D # Fit with vrcp with specification of Log-L segments and "c1" options with 
##D # and without common variance restriction
##D ans <- vrcp(z,3.9,4.5,"c1","Log","L","Common") # Fit with common variance
##D ans
##D 
##D # The fitted Log-L regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") + 
##D ggtitle("LogL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,3.8,4.2,"c1","Log","L","Diff") # Fit with different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogL-c1-diff model: Estimate (in magenta) vs. true model")
##D 
##D # results look similar, not bad.
##D 
##D # Fit with Log-L segments and "c0" options with and without common variance restriction
##D ans <- vrcp(z,3.5,4.5,"c0","Log","L","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogL-c0-com fit to LLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,3.5,4.5,"c0","Log","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogL-c0-diff fit to LLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D # Little worse than the one with c1 constraint
##D 
##D # Fit with Log-L segments and u" options with and without common variance restriction
##D ans <- vrcp(z,3.5,4.5,"u","Log","L","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-u-com fit to LLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,3.5,4.5,"u","Log","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LLog-u-diff fit to LLog-c1-diff model: Estimate (in magenta) vs. true model")
##D 
##D # Clearly shows lack of fit at the change point.   
##D # Again, the correct specification of the model, or use of available information is important.
##D 
##D 
##D # Example 4: QL-c1-com model, fitted by Q-L and Exp-L models, 
##D # with and without a common variance constraint, respectively.
##D 
##D # Simulate Q-L data
##D x1<-seq(0,2,by=0.05)
##D x2<-seq(2,5,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 2+2*x1+2*x1^2
##D yt2 <- -6+10*x2
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,3)
##D y2<- yt2+rnorm(length(x2),0,3)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Q-L regression with a change point between 1.8 and 2.5
##D # Fit with vrcp with specification of Q-L segments and "c1" options with 
##D # and without common variance restriction
##D ans <- vrcp(z,1.8,2.5,"c1","Q","L","Common")  # Common variance
##D ans
##D 
##D # The fitted Q-L regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.8,2.5,"c1","Q","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QL-c1-diff model: Estimate (in magenta) vs. true model")
##D 
##D # Fit with vrcp with specification of Exp-L segments and "c1" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.5,"c1","Exp","L","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-c1-com fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"c1","Exp","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-c1-diff fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D # Fit with vrcp with specification of Exp-L segments and "c0" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.5,"c0","Exp","L","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-c0-com fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"c0","Exp","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-c0-com fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D # Fit with vrcp with specification of Exp-L segments and "u" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.5,"u","Exp","L","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-u-com fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"u","Exp","L","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpL-u-com fit to QL-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D # Exp-L fits surprisingly well in this case.
##D 
##D 
##D # Example 5: Exp-Exp with "c0" change point and common variance. - No option of smoothness
##D # Simulate the data
##D x1<-seq(0,2,by=0.05)
##D x2<-seq(2.05,5,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 0.916+2*exp(x1)
##D yt2 <- 12+0.5*exp(x2)
##D 
##D # Add noises
##D y1<-yt1+rnorm(length(x1),0,5)
##D y2<-yt2+rnorm(length(x2),0,5)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Exp-Exp regression with a change point between 1.5 and 2.5
##D # Fit with vrcp with specification of Exp-Exp segments and "c0" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.5,"c0","Exp","Exp","Common") # Common variance ## simulation of smooth
##D ans
##D 
##D # The fitted Exp-Exp regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpExp-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"c0","Exp","Exp","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpExp-c0-diff model: Estimate (in magenta) vs. true model")
##D 
##D # Fit with vrcp with specification of Exp-Exp segments and "u" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.2,"u","Exp","Exp","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpExp-u-com fit to ExpExp-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"u","Exp","Exp","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("ExpExp-u-diff fit to ExpExp-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D # Unconstraint fits okay, considering information of continuity was not used.
##D 
##D 
##D # Example 6: Log-Log with "c0" change point and common variance. - No option of smoothness
##D # Simulate the data
##D x1<-seq(2,4,by=0.05)
##D x2<-seq(4.05,7,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 2 - 2*log(x1)
##D yt2 <- 13.1 - 10*log(x2)
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,0.5)
##D y2<- yt2+rnorm(length(x2),0,0.5)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Log-Log regression with a change point between 3.5 and 4.5
##D # Fit with vrcp with specification of Log-Log segments and "c0" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,3.5,4.5,"c0","Log","Log","Common") # Common variance
##D ans
##D 
##D # The fitted Log-Log regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogLog-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,3.5,4.5,"c0","Log","Log","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogLog-c0-diff model: Estimate (in magenta) vs. true model")
##D 
##D # Fit with vrcp with specification of Log-Log segments and "u" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,3.7,4.5,"u","Log","Log","Common") # Common variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogLog-u-com fit to LogLog-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D 
##D ans <- vrcp(z,3.7,4.5,"u","Log","Log","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LogLog-u-diff fit to LogLog-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D 
##D # Example 7: Q-Exp with "c1" change point and common variance. 
##D # Simulate the data
##D x1<-seq(0,2,by=0.05)
##D x2<-seq(2,5,by=0.05)
##D 
##D # The true regression functions
##D yt1 <-  .2+.2*x1+.5*x1^2
##D yt2 <- .3832+.3*exp(x2)
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,3)
##D y2<- yt2+rnorm(length(x2),0,3)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Q-Exp regression with a change point between 1.5 and 2.2
##D # Fit with vrcp with specification of Q-Exp segments and "c1" options with 
##D # and without common variance restriction
##D 
##D ans <- vrcp(z,1.5,2.2,"c1","Q","Exp","Common") # Common variance
##D ans
##D 
##D # The fitted Q-Exp regression is superimposed on the data
##D # Let's compare it with the true regression 
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QExp-c0-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.2,"c1","Q","Exp","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QExp-c0-diff model: Estimate (in magenta) vs. true model")
##D 
##D 
##D # Example 8: Q-Log with "c1" change point and common variance.
##D # Simulate the data
##D x1<-seq(0.05,2.05,by=0.05)
##D x2<-seq(2.1,5.05,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 2+1*x1+5*x1^2
##D yt2 <- 0+35*log(x2)
##D 
##D # Add noises
##D y1<-yt1+rnorm(length(x1),0,4)
##D y2<-yt2+rnorm(length(x2),0,4)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Q-Log regression with a change point between 1.5 and 2.5
##D # Fit with vrcp with specification of Q-Log segments and "c1" options with 
##D # and without common variance restriction
##D ans <- vrcp(z,1.5,2.5,"c1","Q","Log","Common") # Common variance
##D ans
##D 
##D # The fitted Q-Log regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QLog-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D ans <- vrcp(z,1.5,2.5,"c1","Q","Log","Diff") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("QLog-c1-diff model: Estimate (in magenta) vs. true model")
##D 
##D 
##D # Example 9: Q-Q with "c1" change point and common variance.
##D # Simulate the data
##D x1<-seq(0.05,2,by=0.05)
##D x2<-seq(2.05,5,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 2+10*x1-5*x1^2
##D yt2 <- 30-21*x2+3.5*x2^2
##D 
##D # Add noises
##D y1<-yt1+rnorm(length(x1),0,2)
##D y2<-yt2+rnorm(length(x2),0,2)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a Q-Q regression with a change point between 1.5 and 2.5
##D # Fit with vrcp with specification of Q-Q segments and "c1" options with 
##D # and without common variance restriction
##D ans <- vrcp(z,1.5,2.5,"c1","Q","Q","Common",spline="TRUE") # Common variance
##D ans
##D 
##D # The fitted Q-Q regression and spline are superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt), color = "blue", size=1) +
##D ggtitle("QQ-c1-com model: Estimates vs. true model (in blue)")
##D 
##D ans <- vrcp(z,1.5,2.5,"c1","Q","Q","Diff",spline="TRUE") # Different variance
##D ans
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt), color = "blue", size=1) +
##D ggtitle("QQ-c1-diff model: Estimates vs. true model (in blue)")
##D 
##D # vrcp fits better than splines fitting.
##D 
##D 
##D # Example 10: L-NLExp with "c1" change point and common variance.
##D # Simulate the data
##D x1<- seq(0,2,by=0.05)
##D x2<- seq(2.05,5,by=0.05)
##D 
##D # The true regression functions
##D yt1 <- 10-0.8*x1
##D yt2 <- 8.4 - (-0.78/0.5) + (-0.78/0.5)*(exp(0.5*(x2-2)))
##D 
##D # Add noises
##D y1<- yt1+rnorm(length(x1),0,0.5)
##D y2 <- yt2+rnorm(length(x2),0,0.5)
##D z<-data.frame(c(x1,x2),c(y1,y2))
##D names(z)=c("x","y")
##D 
##D # z is the simulated data in data frame. Let's visualize it
##D plot(z)
##D 
##D # It looks like a L-NLExp regression with a change point between 1.8 and 2.05
##D # Fit with smooth L-NLExp, common or different variances
##D 
##D tryCatch(vrcp(z,1.8,2.05,"c1","L","NLExp","Common",start="FALSE"), error=function(e)
##D {return("Try different starting values. If this still fails, try a different nonlinear model 
##D that might be more suitable to data.")})
##D 
##D ans <- vrcp(z,1.8,2.05,"c1","L","NLExp","Common",start="FALSE")
##D ans
##D 
##D # The fitted L-NLExp regression is superimposed on the data
##D # Let's compare it with the true regression
##D x<-z$x
##D yt<-c(yt1,yt2)
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) +
##D scale_colour_grey(name = "Model") +
##D ggtitle("LNLExp-c1-com model: Estimate (in magenta) vs. true model")
##D 
##D tryCatch(vrcp(z,1.8,2.05,"c1","L","NLExp","Diff",start="FALSE"), error=function(e){
##D return("Try different starting values. If this still fails, try a different nonlinear model 
##D that might be more suitable to data.")})
##D ans <- vrcp(z,1.8,2.05,"c1","L","NLExp","Diff",start="FALSE")
##D ans$plot + ggplot2::geom_line(aes(x = x, y = yt, colour = c("true")), size=1) + 
##D scale_colour_grey(name = "Model") +
##D ggtitle("LNLExp-c1-diff model: Estimate (in magenta) vs. true model")
## End(Not run)



