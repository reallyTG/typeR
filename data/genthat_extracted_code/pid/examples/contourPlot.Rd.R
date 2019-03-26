library(pid)


### Name: contourPlot
### Title: 2-dimensional contour plot of a factorial design model
### Aliases: contourPlot

### ** Examples


# 2-factor example
# ----------------
T <- c(-1, +1, -1, +1)  # centered and scaled temperature
S <- c(-1, -1, +1, +1)  # centered and scaled speed variable
y <- c(69, 60, 64, 53)  # conversion, is our response variable, y
doe.model <- lm(y ~ T + S + T * S)  # model with main effects, and interaction
contourPlot(doe.model)  

# 3-factor example
# ----------------
data(pollutant)
mod.full <- lm(y ~ C*T*S, data=pollutant) 
contourPlot(mod.full, N=50)               # high resolution plot
contourPlot(mod.full, xlab='C', ylab='S',
            main="Strong C:S interaction",
			colour.function=rainbow)
			
# Central composite design
P <- c(-1,   +1,  -1,  +1,     0, -1.41,     0, +1.41)
T <- c(-1,   -1,  +1,  +1, +1.41,     0, -1.41,     0)
y <- c(715, 713, 733, 725,   738,   717,   721,   710)
mod.CCD <- lm(y ~ P*T + I(P^2) + I(T^2))  
contourPlot(mod.CCD, 'P', 'T', xlim=c(-2.2, 2.2), ylim=c(-3,2))



