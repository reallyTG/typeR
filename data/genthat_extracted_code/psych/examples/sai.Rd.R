library(psych)


### Name: sai
### Title: State Anxiety data from the PMC lab over multiple occasions.
### Aliases: sai tai sai.dictionary
### Keywords: datasets

### ** Examples

data(sai)
table(sai$study,sai$time)  #show the counts for repeated measures
#table(sai$study,sai$TOD) #and the studies by time of day
#table(sai$study,sai$drug) # and the studies with drug
#Here are the keys to score the sai total score, positive and negative items
sai.keys <- list(sai = c("tense","regretful" , "upset", "worrying", "anxious", "nervous" ,  
"jittery" , "high.strung", "worried" , "rattled","-calm", 
"-secure","-at.ease","-rested","-comfortable", "-confident" ,"-relaxed" , "-content" , 
"-joyful", "-pleasant"  ) ,
sai.p = c("calm","at.ease","rested","comfortable", "confident", "secure" ,"relaxed" ,     
       "content" , "joyful", "pleasant" ),  
sai.n = c( "tense" , "anxious", "nervous" , "jittery" , "rattled",     "high.strung",  
         "upset", "worrying","worried","regretful" )
) 

 #just get the control subjects
#control <- subset(sai,sai$study %in% c("Cart", "Fast", "SHED",  "RAFT", "SHOP")) 
#pre and post drug studies
#drug <- subset(sai,sai$study %in% c("AGES", "CITY","EMIT", "SALT", "VALE", "XRAY")) 
#pre and post film studies
#film <- subset(sai,sai$study %in% c("FIAT","FLAT", "MAPS", "MIXX") 

#this next set allows us to score those sai items that overlap with the msq item sets
msq.items <- c("anxious" ,  "at.ease" ,  "calm" ,     "confident", "content",   "jittery", 
 "nervous" ,  "relaxed" ,  "tense"  ,   "upset" ) #these overlap with the msq
 
sai.msq.keys <- list(pos =c( "at.ease" ,  "calm" , "confident", "content","relaxed"),
  neg = c("anxious", "jittery", "nervous" ,"tense"  ,   "upset"),
  anx = c("anxious", "jittery", "nervous" ,"tense", "upset","-at.ease" ,  "-calm" ,
  "-confident", "-content","-relaxed"))
sai.not.msq.keys <- list(pos=c(  "secure","rested","comfortable" ,"joyful" , "pleasant" ),    
    neg=c("regretful","worrying", "high.strung","worried", "rattled" ),
    anx = c("regretful","worrying", "high.strung","worried", "rattled",     "-secure",      
    "-rested", "-comfortable", "-joyful",  "-pleasant" )) 
sai.alternate.forms <- list( pos1 =c( "at.ease","calm","confident","content","relaxed"),
  neg1 = c("anxious", "jittery", "nervous" ,"tense"  ,   "upset"),
  anx1 = c("anxious", "jittery", "nervous" ,"tense", "upset","-at.ease" ,  "-calm" ,
       "-confident", "-content","-relaxed"),
  pos2=c(  "secure","rested","comfortable" ,"joyful" , "pleasant" ),    
  neg2=c("regretful","worrying", "high.strung","worried", "rattled" ),
  anx2 = c("regretful","worrying", "high.strung","worried", "rattled", "-secure",      
    "-rested", "-comfortable", "-joyful",  "-pleasant" )) 
  
#sai.repeated <- c("AGES","Cart","Fast","FIAT","FILM","FLAT","HOME","PAT","RIM","SALT",
#     "SAM","SHED","SHOP","VALE","XRAY")
#sai12 <- subset(sai,sai$study %in% sai.repeated)   #the subset with repeated measures
#Choose those studies with repeated measures by :
#sai.control <- subset(sai,sai$study %in% c("Cart", "Fast", "SHED", "SHOP"))
#sai.film <- subset(sai,sai$study %in% c("FIAT","FLAT") )  
#sai.drug <- subset(sai,sai$study %in% c("AGES",  "SALT", "VALE", "XRAY"))
#sai.day <- subset(sai,sai$study %in% c("SAM", "RIM"))
 



