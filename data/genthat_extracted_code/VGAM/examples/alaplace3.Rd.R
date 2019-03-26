library(VGAM)


### Name: alaplace
### Title: Asymmetric Laplace Distribution Family Functions
### Aliases: alaplace1 alaplace2 alaplace3
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1: quantile regression with smoothing splines
##D set.seed(123); adata <- data.frame(x2 = sort(runif(n <- 500)))
##D mymu <- function(x) exp(-2 + 6*sin(2*x-0.2) / (x+0.5)^2)
##D adata <- transform(adata, y = rpois(n, lambda = mymu(x2)))
##D mytau <- c(0.25, 0.75); mydof <- 4
##D 
##D fit <- vgam(y ~ s(x2, df = mydof), data = adata, trace = TRUE, maxit = 900,
##D             alaplace2(tau = mytau, llocat = "loge",
##D                       parallel.locat = FALSE))
##D fitp <- vgam(y ~ s(x2, df = mydof), data = adata, trace = TRUE, maxit = 900,
##D              alaplace2(tau = mytau, llocat = "loge", parallel.locat = TRUE))
##D 
##D par(las = 1); mylwd <- 1.5
##D with(adata, plot(x2, jitter(y, factor = 0.5), col = "orange",
##D                  main = "Example 1; green: parallel.locat = TRUE",
##D                  ylab = "y", pch = "o", cex = 0.75))
##D with(adata, matlines(x2, fitted(fit ), col = "blue",
##D                      lty = "solid", lwd = mylwd))
##D with(adata, matlines(x2, fitted(fitp), col = "green",
##D                      lty = "solid", lwd = mylwd))
##D finexgrid <- seq(0, 1, len = 1001)
##D for (ii in 1:length(mytau))
##D   lines(finexgrid, qpois(p = mytau[ii], lambda = mymu(finexgrid)),
##D         col = "blue", lwd = mylwd)
##D fit@extra  # Contains useful information
##D 
##D 
##D # Example 2: regression quantile at a new tau value from an existing fit
##D # Nb. regression splines are used here since it is easier.
##D fitp2 <- vglm(y ~ sm.bs(x2, df = mydof), data = adata, trace = TRUE,
##D               alaplace1(tau = mytau, llocation = "loge",
##D                         parallel.locat = TRUE))
##D 
##D newtau <- 0.5  # Want to refit the model with this tau value
##D fitp3 <- vglm(y ~ 1 + offset(predict(fitp2)[, 1]),
##D               alaplace1(tau = newtau, llocation = "loge"), data = adata)
##D with(adata, plot(x2, jitter(y, factor = 0.5), col = "orange",
##D                pch = "o", cex = 0.75, ylab = "y",
##D                main = "Example 2; parallel.locat = TRUE"))
##D with(adata, matlines(x2, fitted(fitp2), col = "blue",
##D                      lty = 1, lwd = mylwd))
##D with(adata, matlines(x2, fitted(fitp3), col = "black",
##D                      lty = 1, lwd = mylwd))
##D 
##D 
##D # Example 3: noncrossing regression quantiles using a trick: obtain
##D # successive solutions which are added to previous solutions; use a log
##D # link to ensure an increasing quantiles at any value of x.
##D 
##D mytau <- seq(0.2, 0.9, by = 0.1)
##D answer <- matrix(0, nrow(adata), length(mytau))  # Stores the quantiles
##D adata <- transform(adata, offsety = y*0)
##D usetau <- mytau
##D for (ii in 1:length(mytau)) {
##D # cat("\n\nii  = ", ii, "\n")
##D   adata <- transform(adata, usey = y-offsety)
##D   iloc <- ifelse(ii == 1, with(adata, median(y)), 1.0)  # Well-chosen!
##D   mydf <- ifelse(ii == 1, 5, 3)  # Maybe less smoothing will help
##D # lloc <- ifelse(ii == 1, "loge", "loge")  # 2nd value must be "loge"
##D   fit3 <- vglm(usey ~ sm.ns(x2, df = mydf), data = adata, trace = TRUE,
##D                alaplace2(tau = usetau[ii], lloc = "loge", iloc = iloc))
##D   answer[, ii] <- (if(ii == 1) 0 else answer[, ii-1]) + fitted(fit3)
##D   adata <- transform(adata, offsety = answer[, ii])
##D }
##D 
##D # Plot the results.
##D with(adata, plot(x2, y, col = "blue",
##D      main = paste("Noncrossing and nonparallel; tau  = ",
##D                 paste(mytau, collapse = ", "))))
##D with(adata, matlines(x2, answer, col = "orange", lty = 1))
##D 
##D # Zoom in near the origin.
##D with(adata, plot(x2, y, col = "blue", xlim = c(0, 0.2), ylim = 0:1,
##D      main = paste("Noncrossing and nonparallel; tau  = ",
##D                 paste(mytau, collapse = ", "))))
##D with(adata, matlines(x2, answer, col = "orange", lty = 1))
## End(Not run)



