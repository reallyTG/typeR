library(PEIP)


### Name: picard_vals
### Title: Picard plot
### Aliases: picard_vals
### Keywords: misc

### ** Examples

####
n = 20
G = shawG(n,n)
spike = rep(0,n)
spike[10] = 1
dspiken = G 

set.seed(2015)
dspiken = dspiken + 6e-6 *rnorm(length(dspiken))
Utube=svd(G);
U = Utube$u
V = Utube$v
S = Utube$d
s=Utube$d
 R3 = picard_vals(U,s,dspiken);
utd = R3$utd
utd_norm= R3$utd_norm
###  Produce the Picard plot.

x_ind=1:length(s);
##  
plot( range(x_ind) , range(c(s ,abs(utd),abs(utd_norm))),
          type='n',  log='y', xlab="i", ylab="" )
lines(x_ind,s, col='black')
points(x_ind,abs(utd), pch=1, col='red')
points(x_ind,abs(utd_norm), pch=2, col='blue')

title("Picard Plot for Shaw Problem")







