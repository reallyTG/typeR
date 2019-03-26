library(MVar.pt)


### Name: GSVD
### Title: Decomposicao de valor singular generalizada (GSVD).
### Aliases: GSVD
### Keywords: Decomposicao de valor singular generalizada GSVD

### ** Examples

M = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), nrow = 4, ncol = 3)

svd(M)  # decomposicao de valor singular usual

GSVD(M) # GSVD com os mesmos resultados anteriores

# GSVD com pesos para linhas e colunas
GSVD(M, PLin = c(0.1,0.5,2,1.5), PCol = c(1.3,2,0.8)) 



