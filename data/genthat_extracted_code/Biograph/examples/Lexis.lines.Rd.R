library(Biograph)


### Name: Lexis.lines
### Title: Draws Lexis diagram with lifelines for selected subjects
### Aliases: Lexis.lines

### ** Examples

#  Example 1: Employment careers
  data(GLHS) 
  z<- Parameters (GLHS)
  GLHS.yr <- date_b(Bdata=GLHS,selectday=1,format.out="year")
  D <- Biograph.long (GLHS.yr)
  tit5 <- "Employment careers for a selection of subjects. GLHS"
  subjects <- c(1,78,120,208)
  z <- Lexis.lines (Bdata=GLHS.yr,Dlong=D$Depisode,subjectsID = subjects,title = tit5)

#  Example 2: Long data format need to be obtained
  z <- Lexislines.episodes (Bdata=GLHS.yr,subjectsID = subjects,title = tit5)  

#  Example 3: Living arrangements 
  data(NLOG98)
  z<- Parameters (NLOG98)
  NLOG98.yr <- date_b(Bdata=NLOG98,selectday=1,format.out="year")
  D <- Biograph.long (NLOG98.yr)
  tit5 <- "Living arrangements for a selection of subjects, NLOG98"
subjectsID <- c(8,96,980,1056,1496,2883)
  z <- Lexis.lines (NLOG98.yr,D$Depisode,subjectsID = subjectsID,title = tit5)



