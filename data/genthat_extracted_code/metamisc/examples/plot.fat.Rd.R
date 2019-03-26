library(metamisc)


### Name: plot.fat
### Title: Display results from the funnel plot asymmetry test
### Aliases: plot.fat

### ** Examples

data(Fibrinogen)
b <- log(Fibrinogen$HR)
b.se <- ((log(Fibrinogen$HR.975) - log(Fibrinogen$HR.025))/(2*qnorm(0.975)))
n.total <- Fibrinogen$N.total

# A very simple funnel plot
plot(fat(b=b, b.se=b.se))

# Add custom tickmarks for the X-axis
plot(fat(b=b, b.se=b.se, n.total=n.total, method="M-FIV"), xlab="Hazard ratio", xaxt="n")
axis(1, at=c(log(0.5), log(1), log(1.5), log(2), log(3)), labels=c(0.5, 1, 1.5, 2,3))




