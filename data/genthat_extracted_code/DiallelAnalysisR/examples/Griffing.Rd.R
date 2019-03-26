library(DiallelAnalysisR)


### Name: Griffing
### Title: Diallel Analysis using Griffing Approach
### Aliases: Griffing

### ** Examples

#-------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 1 & Model 1
#-------------------------------------------------------------
Griffing1Data1 <-
 Griffing(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = GriffingData1
   , Method = 1
   , Model  = 1
 )
names(Griffing1Data1)
Griffing1Data1
Griffing1Data1Means <- Griffing1Data1$Means
Griffing1Data1ANOVA <- Griffing1Data1$ANOVA
Griffing1Data1Genetic.Components <- Griffing1Data1$Genetic.Components
Griffing1Data1Effects <- Griffing1Data1$Effects
Griffing1Data1StdErr <- as.matrix(Griffing1Data1$StdErr)


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 1 & Model 2
#--------------------------------------------------------------
Griffing2Data1 <-
 Griffing(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = GriffingData1
   , Method = 1
   , Model  = 2
 )
names(Griffing2Data1)
Griffing2Data1
Griffing2Data1Means <- Griffing2Data1$Means
Griffing2Data1ANOVA <- Griffing2Data1$ANOVA
Griffing2Data1Genetic.Components <- Griffing2Data1$Genetic.Components


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 2 & Model 1
#--------------------------------------------------------------
Griffing1Data2 <-
 Griffing(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = GriffingData2
   , Method = 2
   , Model  = 1
 )
names(Griffing1Data2)
Griffing1Data2
Griffing1Data2Means <- Griffing1Data2$Means
Griffing1Data2ANOVA <- Griffing1Data2$ANOVA
Griffing1Data2Genetic.Components <- Griffing1Data2$Genetic.Components
Griffing1Data2Effects <- Griffing1Data2$Effects
Griffing1Data2StdErr <- as.matrix(Griffing1Data2$StdErr)


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 2 & Model 2
#--------------------------------------------------------------
Griffing2Data2 <-
 Griffing(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = GriffingData2
   , Method = 2
   , Model  = 2
 )
names(Griffing2Data2)
Griffing2Data2
Griffing2Data2Means <- Griffing2Data2$Means
Griffing2Data2ANOVA <- Griffing2Data2$ANOVA
Griffing2Data2Genetic.Components <- Griffing2Data2$Genetic.Components


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 3 & Model 1
#--------------------------------------------------------------
Griffing1Data3 <-
 Griffing(
     y      = Yield
   , Rep    = Rep
   , Cross1 = Cross1
   , Cross2 = Cross2
   , data   = GriffingData3
   , Method = 3
   , Model  = 1
 )
names(Griffing1Data3)
Griffing1Data3
Griffing1Data3Means <- Griffing1Data3$Means
Griffing1Data3ANOVA <- Griffing1Data3$ANOVA
Griffing1Data3Genetic.Components <- Griffing1Data3$Genetic.Components
Griffing1Data3Effects <- Griffing1Data3$Effects
Griffing1Data3StdErr <- as.matrix(Griffing1Data3$StdErr)


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 3 & Model 2
#--------------------------------------------------------------
Griffing2Data3 <-
 Griffing(
     y       = Yield
   , Rep     = Rep
   , Cross1  = Cross1
   , Cross2  = Cross2
   , data    = GriffingData3
   , Method  = 3
   , Model   = 2
 )
names(Griffing2Data3)
Griffing2Data3
Griffing2Data3Means <- Griffing2Data3$Means
Griffing2Data3ANOVA <- Griffing2Data3$ANOVA
Griffing2Data3Genetic.Components <- Griffing2Data3$Genetic.Components


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 4 & Model 1
#--------------------------------------------------------------
Griffing1Data4 <-
 Griffing(
     y       = Yield
   , Rep     = Rep
   , Cross1  = Cross1
   , Cross2  = Cross2
   , data    = GriffingData4
   , Method  = 4
   , Model   = 1
 )
names(Griffing1Data4)
Griffing1Data4
Griffing1Data4Means <- Griffing1Data4$Means
Griffing1Data4ANOVA <- Griffing1Data4$ANOVA
Griffing1Data4Genetic.Components <- Griffing1Data4$Genetic.Components
Griffing1Data4Effects <- Griffing1Data4$Effects
Griffing1Data4StdErr <- as.matrix(Griffing1Data4$StdErr)


#--------------------------------------------------------------
## Diallel Analysis with Griffing's Aproach Method 4 & Model 2
#--------------------------------------------------------------
Griffing2Data4 <-
 Griffing(
     y       = Yield
   , Rep     = Rep
   , Cross1  = Cross1
   , Cross2  = Cross2
   , data    = GriffingData4
   , Method  = 4
   , Model   = 2
 )
names(Griffing2Data4)
Griffing2Data4
Griffing2Data4Means <- Griffing2Data4$Means
Griffing2Data4ANOVA <- Griffing2Data4$ANOVA
Griffing2Data4Genetic.Components <- Griffing2Data4$Genetic.Components



