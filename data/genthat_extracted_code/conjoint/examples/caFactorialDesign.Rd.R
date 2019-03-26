library(conjoint)


### Name: caFactorialDesign
### Title: Function caFactorialDesign creates full or fractional factorial
###   design
### Aliases: caFactorialDesign
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="full")
print(design)
print(cor(caEncodedDesign(design)))

#Example 2
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment)
print(design)
print(cor(caEncodedDesign(design)))

#Example 3
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="orthogonal")
print(design)
print(cor(caEncodedDesign(design)))

#Example 4
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="fractional",cards=16)
print(design)
print(cor(caEncodedDesign(design)))

#Example 5
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="fractional")
print(design)
print(cor(caEncodedDesign(design)))

#Example 6
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="ca")
print(design)
print(cor(caEncodedDesign(design)))

#Example 7
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="aca")
print(design)
print(cor(caEncodedDesign(design)))



