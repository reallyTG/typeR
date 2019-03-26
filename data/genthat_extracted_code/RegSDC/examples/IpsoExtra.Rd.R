library(RegSDC)


### Name: IpsoExtra
### Title: Extended variant of RegSDCipso
### Aliases: IpsoExtra
### Keywords: internal

### ** Examples

x <- matrix(1:5, 5, 1)
y <- matrix(10 * (sample(7:39, 15) + 4 * (1:15)), 5, 3)
colnames(y) <- paste("y", 1:3, sep = "")
y1 <- y[, 1, drop = FALSE]

IpsoExtra(y, x)  # Same as RegSDCipso(y, x)

IpsoExtra(y, x, resScale = 0)  # Fitted values (whole numbers in this case)
IpsoExtra(y, x, nRep = 2, resScale = 1e-05)  # Downscaled residuals 

ySynth <- IpsoExtra(y1, x, nRep = 2, rmse = 0.25)  # Downscaled residuals 
summary(lm(ySynth ~ x))  # Identical regression results with Residual standard error: 0.25

IpsoExtra(fitted(lm(y1 ~ x)), x, nRep = 2, resScale = 0.1)  # resScale no effect since perfect fit
IpsoExtra(fitted(lm(y1 ~ x)), x, nRep = 2, resScale = 0.1, rmse = 2)  # with warning

# Using data in the paper
IpsoExtra(RegSDCdata("sec7y"), RegSDCdata("sec7x"))  # Similar to Y*
IpsoExtra(RegSDCdata("sec7y"), RegSDCdata("sec7x"), rmse = 1)



