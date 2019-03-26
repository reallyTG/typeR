library(HistDAWass)


### Name: WH.bind
### Title: Method WH.bind
### Aliases: WH.bind WH.bind,MatH,MatH-method WH.bind,MatH-method

### ** Examples

# binding by row 
M1<-BLOOD[1:10,1]
M2<-BLOOD[1:10,3]
MAT<-WH.bind(M1,M2, byrow=TRUE)
# binding by col
M1<-BLOOD[1:10,1]
M2<-BLOOD[1:10,3]
MAT<-WH.bind(M1,M2, byrow=FALSE)



