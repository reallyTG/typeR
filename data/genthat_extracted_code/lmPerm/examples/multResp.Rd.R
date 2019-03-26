library(lmPerm)


### Name: multResp
### Title: Multple response creation
### Aliases: multResp
### Keywords: design

### ** Examples


	A<-1:5
	B<-1:5
	multResp(A,B)

	data(Plasma)
	anova(lmp(multResp(Amin,Pct,sinpoly)~.,Plasma))



