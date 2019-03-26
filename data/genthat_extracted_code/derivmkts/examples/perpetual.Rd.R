library(derivmkts)


### Name: perpetual
### Title: Perpetual American options
### Aliases: perpetual callperpetual putperpetual

### ** Examples

s=40; k=40; v=0.30; r=0.08;  d=0.02;
callperpetual(s, k, v, r, d)

putperpetual(s, c(35, 40, 45), v, r, d, showbarrier=TRUE)





