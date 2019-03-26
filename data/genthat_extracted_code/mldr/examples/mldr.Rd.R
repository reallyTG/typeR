library(mldr)


### Name: mldr
### Title: Creates an object representing a multilabel dataset
### Aliases: mldr

### ** Examples


library(mldr)
## Not run: 
##D # Read "yeast.arff" and labels from "yeast.xml"
##D mymld <- mldr("yeast")
##D 
##D # Read "yeast.arff" and labels from "yeast.xml", converting categorical
##D # attributes to factors
##D mymld <- mldr("yeast", stringsAsFactors = TRUE)
##D 
##D # Read "yeast-tra.arff" and labels from "yeast.xml"
##D mymld <- mldr("yeast-tra", xml_file = "yeast.xml")
##D 
##D # Read "yeast.arff" specifying the amount of attributes to be used as labels
##D mymld <- mldr("yeast", label_amount = 14)
##D 
##D # Read MEKA style dataset, without XML file and giving extension
##D mymld <- mldr("IMDB.arff", use_xml = FALSE, auto_extension = FALSE)
## End(Not run)



