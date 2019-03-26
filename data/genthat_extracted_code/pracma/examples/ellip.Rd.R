library(pracma)


### Name: ellipke,ellipj
### Title: Elliptic and Jacobi Elliptic Integrals
### Aliases: ellipke ellipj
### Keywords: specfun

### ** Examples

x <- linspace(0, 1, 20)
ke <- ellipke(x)

## Not run: 
##D plot(x, ke$k, type = "l", col ="darkblue", ylim = c(0, 5),
##D      main = "Elliptic Integrals")
##D lines(x, ke$e, col = "darkgreen")
##D legend( 0.01, 4.5,
##D         legend = c("Elliptic integral of first kind",
##D                    "Elliptic integral of second kind"),
##D         col = c("darkblue", "darkgreen"), lty = 1)
##D grid()
## End(Not run)

u <- c(0, 1, 2, 3, 4, 5)
m <- seq(0.0, 1.0, by = 0.2)
je <- ellipj(u, m)
# $sn       0.0000  0.8265  0.9851  0.7433  0.4771  0.9999
# $cn       1.0000  0.5630 -0.1720 -0.6690 -0.8789  0.0135
# $dn       1.0000  0.9292  0.7822  0.8176  0.9044  0.0135
je$sn^2 + je$cn^2       # 1 1 1 1 1 1
je$dn^2 + m * je$sn^2   # 1 1 1 1 1 1



