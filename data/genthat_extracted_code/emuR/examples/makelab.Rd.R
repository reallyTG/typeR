library(emuR)


### Name: makelab
### Title: Write out ESPS-style label files
### Aliases: makelab
### Keywords: IO

### ** Examples


   #first two segments (for the whole example) of segmentlist vowlax 
   vowlax[1:2,]

   #format track of vowlax
   vowlax.fdat[1:2,]

   #Formant values of the midpoint of the segment
   vowlax.fdat.5 = dcut(vowlax.fdat,0.5,prop=TRUE)

   #the time marks of the midpoint of the segment
   times = vowlax.fdat.5[1:2,1]
   times

   #utterance names to the segments
   utts = utt(vowlax[1:2,])
   utts 

   #the path to save the label files to "." is the RHOME Directory
   path = "."

   #write the label files to path
   ## Not run: makelab(times, utts, path, labels="T")

   #the first two segments are from the same utterance,
   #thus one label file was created in the R_HOME directory




