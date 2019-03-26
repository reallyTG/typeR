library(emuR)


### Name: eplot
### Title: Plot ellipses for two-dimensional data
### Aliases: eplot
### Keywords: dplot

### ** Examples



   data(vowlax)
   data <- cbind(vowlax.df$F1,vowlax.df$F2)
   phonetic = vowlax.l
   word = vowlax.word

   eplot(data, phonetic)
    
  
   eplot(data, phonetic, form=TRUE, main="F1 x F2 plane", centroid=TRUE)
   eplot(data, phonetic, form=TRUE, main="F1 x F2 plane", dopoints=TRUE)
   eplot(data, phonetic, form=TRUE, main="F1 x F2 plane in Bark", 
         dopoints=TRUE, scaling="bark")
   eplot(data, phonetic, form=TRUE, main="F1 x F2 plane in Bark b/w with linetype", 
         col=FALSE, lty=TRUE, dopoints=TRUE, scaling="bark") 
   eplot(data, phonetic, form=TRUE, main="F1 x F2 plane", 
         doellipse=FALSE, dopoints=TRUE)
   eplot(data, phonetic, form=TRUE, dopoints=TRUE, 
         prob=0.5, main="F1 x F2 plane, 50% confidence intervals")
   eplot(data, phonetic, form=TRUE, dopoints=TRUE, 
         nsdev=2, main="F1 x F2 plane, 2 standard deviations")
   

   temp <- phonetic %in% c("a", "O")
   eplot(data[temp,], phonetic[temp], form=TRUE,  main="F1 x F2 [A] and [O] only", centroid=TRUE)
   

   temp <- phonetic=="O"
   eplot(data[temp,], phonetic[temp], word[temp], form=TRUE, 
         dopoints=TRUE, main="[O] only showing word labels")  
      
   






