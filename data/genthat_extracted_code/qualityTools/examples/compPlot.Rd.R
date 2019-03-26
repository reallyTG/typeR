library(qualityTools)


### Name: compPlot
### Title: Function to create comparison Plots
### Aliases: compPlot
### Keywords: Measurement Systems Analysis Six Sigma

### ** Examples

#create gageRR-object
gdo = gageRRDesign(Operators = 3, Parts = 10, Measurements = 3, 
      randomize = FALSE)
#vector of responses       
y = c(0.29,0.08, 0.04,-0.56,-0.47,-1.38,1.34,1.19,0.88,0.47,0.01,0.14,-0.80,       
      -0.56,-1.46, 0.02,-0.20,-0.29,0.59,0.47,0.02,-0.31,-0.63,-0.46,2.26,
      1.80,1.77,-1.36,-1.68,-1.49,0.41,0.25,-0.11,-0.68,-1.22,-1.13,1.17,0.94,
      1.09,0.50,1.03,0.20,-0.92,-1.20,-1.07,-0.11, 0.22,-0.67,0.75,0.55,0.01,
      -0.20, 0.08,-0.56,1.99,2.12,1.45,-1.25,-1.62,-1.77,0.64,0.07,-0.15,-0.58,
      -0.68,-0.96,1.27,1.34,0.67,0.64,0.20,0.11,-0.84,-1.28,-1.45,-0.21,0.06,
      -0.49,0.66,0.83,0.21,-0.17,-0.34,-0.49,2.01,2.19,1.87,-1.31,-1.50,-2.16)
#appropriate responses      
response(gdo)=y  
#perform and gageRR                                                                  
gdo=gageRR(gdo)                                                                    
compPlot(gdo,pch=19)                                                            



