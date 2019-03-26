library(secr)


### Name: make.traps
### Title: Build Detector Array
### Aliases: make.grid make.circle make.poly make.transect make.telemetry
### Keywords: datagen

### ** Examples

demo.traps <- make.grid()
plot(demo.traps)

## compare numbering schemes
par (mfrow = c(2,4), mar = c(1,1,1,1), xpd = TRUE)
for (id in c("numx", "numy", "alphax", "alphay", "numxb", 
    "numyb"))
{
    temptrap <- make.grid(nx = 7, ny = 5, ID = id)
    plot (temptrap, border = 10, label = TRUE, offset = 7, 
        gridl = FALSE)
}

temptrap <- make.grid(nx = 7, ny = 5, hollow = TRUE)
plot (temptrap, border = 10, label = TRUE, gridl = FALSE)

plot(make.circle(n = 20, spacing = 30), label = TRUE, offset = 9)
summary(make.circle(n = 20, spacing = 30))


## jitter locations randomly within grid square
## and plot over `mask'
temptrap <- make.grid(nx = 7, ny = 7, spacing = 30)
tempmask <- make.mask(temptrap, buffer = 15, nx = 7, ny = 7)
temptrap[,] <- temptrap[,] + 30 * (runif(7*7*2) - 0.5)
plot(tempmask, dots = FALSE, mesh = 'white')
plot(temptrap, add = TRUE)




