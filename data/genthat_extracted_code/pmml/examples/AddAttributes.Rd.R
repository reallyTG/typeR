library(pmml)


### Name: AddAttributes
### Title: adds attribute values to an existing element in a given PMML
###   file
### Aliases: AddAttributes
### Keywords: interface

### ** Examples


 # make a sample model
 library(pmml)
 model0 <- lm(Sepal.Length~., data=iris[,-5])
 model <- pmml(model0)

 # The resulting PMML:
 # <PMML version="4.3" ... xmlns="http://www.dmg.org/PMML-4_3">
 # <Header ... description="Linear Regression Model"/>
 # <DataDictionary numberOfFields="4">
 # .
 # .
 # </DataDictionary>
 # <RegressionModel modelName="Linear_Regression_Model" 
 #     functionName="regression" 
 #     algorithmName="least squares">
 #  <MiningSchema>
 #  . 
 #  .
 #  </MiningSchema>
 # .
 # .
 #  <RegressionTable intercept="1.85599749291755">
 #   <NumericPredictor name="Sepal.Width" exponent="1" 
 #    coefficient="0.650837159313218"/>
 #   <NumericPredictor name="Petal.Length" exponent="1" 
 #    coefficient="0.709131959136729"/>
 #   <NumericPredictor name="Petal.Width" exponent="1" 
 #    coefficient="-0.556482660167024"/>
 #  </RegressionTable>
 # </RegressionModel>
 # </PMML>

 # Add arbitrary attributes to the 1st 'NumericPredictor' element. The 
 # attributes are for demostration only, they are not allowed under 
 # the PMML schema. The command assumes the default namespace.
 AddAttributes(model, "/p:PMML/descendant::p:NumericPredictor[1]", 
              attributes=c(a=1,b="b"))

 # add attributes to the NumericPredictor element which has 
 # 'Petal.Length' as the 'name' attribute.
 AddAttributes(model, 
    "/p:PMML/descendant::p:NumericPredictor[@name='Petal.Length']", 
    attributes=c(a=1,b="b"))

 # 3 NumericElements exist which have '1' as the 'exponent' attribute.
 # Add new attributes to the 3rd one.
 AddAttributes(model, 
    "/p:PMML/descendant::p:NumericPredictor[@exponent='1'][3]", 
    attributes=c(a=1,b="b"))

 # add attributes to the 1st element whose 'name' attribute contains 
 # 'Length'.
 AddAttributes(model,
    "/p:PMML/descendant::p:NumericPredictor[contains(@name,'Length')]", 
    attributes=c(a=1,b="b"))




