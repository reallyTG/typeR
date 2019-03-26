library(emon)


### Name: detect
### Title: Probability of circular patch detection
### Aliases: detect

### ** Examples

detect(method='R', statistic='P', area=100, radius=2, ssize=15)$prob
detect(method='R', statistic='N', area=100, radius=2, pdetect=0.95)$ssize
detect(method='R', statistic='R', area=100, pdetect=0.95, ssize=15)$rad

detect(method='S', statistic='P', area=100, radius=1.4, ssize=15)
detect(method='S', statistic='N', area=100, radius=1.4, pdetect=0.6)

# Plot patch detection as a function of radius
square = rep(0,200); rand = square; triang = rand
radius = seq(0.01, 2, 0.01)

for (j in 1:200) {
rand[j] = detect(method='R', statistic='P', area=100, radius=radius[j], ssize=15)$p
square[j] = detect(method='S', statistic='P', area=100, radius=radius[j], ssize=15)$p
triang[j] = detect(method='T', statistic='P', area=100, radius=radius[j], ssize=15)$p
}

plot(radius, rand, ylim=c(0,1), xlab='Patch radius', ylab='Probability detection', type='l')
lines(radius, square, col=2, lty=2)
lines(radius, triang, col=3, lty=3)
legend('topleft', legend=c('Random', 'Square', 'Triangular'), col=c(1,2,3), lty=c(1,2,3))



