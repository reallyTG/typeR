library(sysid)


### Name: rarx
### Title: Estimate parameters of ARX recursively
### Aliases: rarx

### ** Examples

Gp1 <- idpoly(c(1,-0.9,0.2),2,ioDelay=2,noiseVar = 0.1)
Gp2 <- idpoly(c(1,-1.2,0.35),2.5,ioDelay=2,noiseVar = 0.1)
uk = idinput(2044,'prbs',c(0,1/4)); N = length(uk);
N1 = round(0.35*N); N2 = round(0.4*N); N3 = N-N1-N2;
yk1 <- sim(Gp1,uk[1:N1],addNoise = TRUE)
yk2 <- sim(Gp2,uk[N1+1:N2],addNoise = TRUE)
yk3 <- sim(Gp1,uk[N1+N2+1:N3],addNoise = TRUE)
yk <- c(yk1,yk2,yk3)
z <- idframe(yk,uk,1)
g(theta,yhat) %=% rarx(z,c(2,1,2))




