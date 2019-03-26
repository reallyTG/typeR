library(geophys)


### Name: rot2Zplane
### Title: Rotate to Z-plane
### Aliases: rot2Zplane
### Keywords: misc

### ** Examples



P1=runif(3)
P2=runif(3)
P3=runif(3)

PP = rbind(P1, P2, P3, rep(1, 3) )

    g1 = PP[1, 1:3] - PP[3, 1:3]
    g2 = PP[2, 1:3] - PP[3, 1:3]


 B = unlist(AXB.prod(list(x = g1[1], y = g1[2], z = g1[3]), 
        list(x = g2[1], y = g2[2], z = g2[3])))
    B = B/sqrt(sum(B * B))


MF = rot2Zplane(B, P3) 

UMAT = t(PP) 





