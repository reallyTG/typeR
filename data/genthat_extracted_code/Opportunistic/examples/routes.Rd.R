library(Opportunistic)


### Name: routes
### Title: Routing distribution for an Opportunistic network
### Aliases: routes
### Keywords: Opportunistic transmissions routing receptions boradcast
###   network

### ** Examples

## Not run: 
##D #An N=7 Opportunistic system with probabilities p1 = 0.7,...,p7 = 0.1
##D 
##D > p = seq(0.7,0.1,length.out = 7)
##D > routes(p)
##D             Freq Probability   Value
##D route 1        1        p1^7 0.08235
##D route 2        6     p1^5*p2 0.10084
##D route 3       10   p1^3*p2^2 0.12348
##D route 4        4     p1*p2^3  0.1512
##D route 5        5     p1^4*p3 0.12005
##D route 6       12  p1^2*p2*p3   0.147
##D route 7        3     p2^2*p3    0.18
##D route 8        3     p1*p3^2   0.175
##D route 9        4     p1^3*p4  0.1372
##D route 10       6    p1*p2*p4   0.168
##D route 11       2       p3*p4     0.2
##D route 12       3     p1^2*p5   0.147
##D route 13       2       p2*p5    0.18
##D route 14       2       p1*p6    0.14
##D route 15       1          p7     0.1
##D Total         64
## End(Not run)



