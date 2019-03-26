library(AcousticNDLCodeR)


### Name: CorpusCoder
### Title: Codes a corpus for use with NDL with vector of wavefile names
###   and a vector of TextGrid names provided
### Aliases: CorpusCoder

### ** Examples

       ## Not run: 
##D        # assuming the corpus contains wave files and praat textgrids
##D            
##D          setwd(~/Data/MyCorpus) # assuming everything is in one place
##D            
##D          #assuming you have one wav for each annotation
##D            
##D          Waves=list.files(pattern="*.wav",recursive=T)
##D          Annotations=list.files(pattern="*.TextGrids",recursive=T) # see above
##D            
##D          # Lets assume the annotation is in UTF-8 and you want everything from a tier called words
##D          # Lets assume tha you want to dismiss everything in <|>
##D          # Lets assume that have 4 cores available
##D          # Lets assume that you want the defaut settings for the parameters
##D            
##D          Data=CorpusCoderCorpusCoder(Waves, Annotations, AnnotationType = "TextGrid",
##D          TierName = "words", Dismiss = "<|>", Encoding, Fast = F, Cores = 4, 
##D          IntensitySteps = 5, Smooth = 800)
##D          
##D        
## End(Not run)



