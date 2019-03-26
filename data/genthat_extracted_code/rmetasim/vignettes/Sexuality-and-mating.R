## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- echo=F-------------------------------------------------------------
LocalS = matrix(c(0, 0, 0.6, 0.85),byrow=T,ncol=2)
LocalR = matrix(c(0, 1, 0, 0),byrow=T,ncol=2)
LocalM = matrix(c(0, 0, 0, 1),byrow=T,ncol=2)

print("LocalS:")
LocalS
print("LocalR:")
LocalR
print("LocalM:")
LocalM


## ----echo=F--------------------------------------------------------------
LocalS = matrix(c(0, 0, 0, 0,
                  0.5,  0.75, 0, 0,
                  0, 0, 0, 0,
                  0, 0, 0.6, 0.85),byrow=T,ncol=4)

LocalR = matrix(c(0, 0, 0, 0.5,
                  0,  0, 0, 0,
                  0, 0, 0, 0.5,
                  0, 0, 0, 0),byrow=T,ncol=4)

LocalM = matrix(c(0, 0, 0, 0,
                  0,  0, 0, 1,
                  0, 0, 0, 0,
                  0, 0, 0, 0),byrow=T,ncol=4)

print("LocalS:")
LocalS
print("LocalR:")
LocalR
print("LocalM:")
LocalM


