library(protViz)


### Name: AA
### Title: AA - amino acid table
### Aliases: AA

### ** Examples


    data(AA)
    AA
    AA.lm<-lm(AA$Monoisotopic ~ AA$Average)

    plot(AA$Monoisotopic, AA$Average); 
    abline(AA.lm, col='grey')
    text(AA$Monoisotopic, AA$Average, AA$letter1, pos=3)

    plot(AA$Average-AA$Monoisotopic)  
    axis(3,1:20,AA$letter1); 
    abline(v=1:20,col='grey')

	
	
    # computes monoisotopic mass out of formula using the CDK package
    ## Not run: 
##D     	if (require(rcdk)){
##D 	plot(AA$Monoisotopic, 
##D 	     sapply(AA$formula, function(x){
##D 		     get.formula(as.character(x), charge = 1)@mass
##D 	     }))
##D 	}
##D     
## End(Not run)
    ## Not run: 
##D 	    if (require(XML)){
##D 	unimodurl <- url("http://www.unimod.org/xml/unimod_tables.xml")
##D 	unimod.list <- XML::xmlToList(
##D 	  XML::xmlParse(
##D 	    scan(unimodurl, what = character())))
##D 	unimod.AA <- data.frame(
##D 	  do.call('rbind', unimod.list$amino_acids))
##D 	rownames(unimod.AA) <- unimod.AA$one_letter
##D 	    }
##D     
## End(Not run)



