library(infoDecompuTE)


### Name: summaryAovTwoPhase
### Title: Summarize an Theoretical Analysis of Variance Model of Two-Phase
###   Experiments
### Aliases: summaryAovTwoPhase
### Keywords: design

### ** Examples



#Phase 2 experiment  
design2 <- local({ 
  Run = as.factor(rep(1:4, each = 4))
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8,
                            3,4,1,2,
                            7,8,5,6)])
  Sam = as.factor(as.numeric(duplicated(Ani)) + 1)
  Tag = as.factor(c(114,115,116,117)[rep(1:4, 4)])
  Trt = as.factor(c("healthy", "diseased")[c(1,2,1,2,
                            2,1,2,1,
                            1,2,1,2,
                            2,1,2,1)])
  data.frame(Run, Ani, Sam, Tag, Trt)
})
design2
                                  
summaryAovTwoPhase(design2, blk.str1 = "Ani", blk.str2 = "Run", 
trt.str = "Tag + Trt")                                            
   
#Add the sample into the Phase 1 block structure                                           
summaryAovTwoPhase(design2, blk.str1 = "Ani/Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt")                                            


#Assuming there is crossing between the animals and samples 
summaryAovTwoPhase(design2, blk.str1 = "Ani*Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt")                                            

 
#Set Artificial stratum 
design2$AniSet = as.factor(c(2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1))
design2

summaryAovTwoPhase(design2, blk.str1 =  "Ani/Sam", blk.str2 = "AniSet/Run", 
trt.str = "Tag + Trt", var.comp = c("Ani:Sam", "Ani", "Run"))                                    

#Define traetment contrasts                                   
TagA = rep(c(1,1,-1,-1),time = 4)                
TagB = rep(c(1,-1,1,-1),time = 4)                
TagC = TagA * TagB
Tag = list(TagA = TagA, TagB = TagB, TagC = TagC)
Tag


Trt = as.numeric(design2$Trt)-1.5
Trt


summaryAovTwoPhase(design2, blk.str1 =  "Ani/Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt", 
trt.contr = list(Tag = list(TagA = TagA, TagB = TagB, TagC = TagC), Trt = Trt),
table.legend = TRUE)                                

#Compute MS 
set.seed(527)
summaryAovTwoPhase(design2, blk.str1 = "Ani/Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt", response = rnorm(16))$ANOVA                                            

#Generate Latex scripts
summaryAovTwoPhase(design2, blk.str1 = "Ani/Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt", latex = TRUE, fixed.names = c("\\gamma", "\\tau"))  

#Generate Latex scripts with MS
set.seed(527)
summaryAovTwoPhase(design2, blk.str1 = "Ani/Sam", blk.str2 = "Run", 
trt.str = "Tag + Trt", response = rnorm(16), latex = TRUE, 
fixed.names = c("\\gamma", "\\tau") )                               




