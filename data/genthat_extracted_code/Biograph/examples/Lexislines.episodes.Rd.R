library(Biograph)


### Name: Lexislines.episodes
### Title: Draws Lexis diagram with lifelines for selected subjects
### Aliases: Lexislines.episodes Lexislines

### ** Examples

#  Example 1: Employment careers
  data(GLHS) 
  z<- Parameters (GLHS)
  D <- Biograph.long (GLHS)
  tit5 <- "Employment careers for a selection of subjects. GLHS"
  subjects <- c(1,78,120,208)
  z <- Lexislines.episodes (Bdata=GLHS,Dlong=D$Depisode,subjectsID = subjects,title = tit5)

#  Example 2: Long data format need to be obtained
  z <- Lexislines.episodes (Bdata=GLHS,subjectsID = subjects,title = tit5)  

#  Example 3: Living arrangements 
  data(NLOG98)
  z<- Parameters (NLOG98)
  D <- Biograph.long (NLOG98)
  tit5 <- "Living arrangements for a selection of subjects, NLOH98"
  subjectsID <- c(8,96,980,1056,1496,2883)
  z <- Lexislines.episodes (NLOG98,D$Depisode,subjectsID = subjectsID,title = tit5)



