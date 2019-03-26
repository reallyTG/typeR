library(RDFTensor)


### Name: tnsr2trp
### Title: sparse tensor to triples
### Aliases: tnsr2trp

### ** Examples

trp=rbind(
    cbind('Alex',  'loves', 'Don'),
    cbind('Alex',  'loves', 'Elly'),
    cbind('Alex',  'hates', 'Bob'),
    cbind('Don',   'loves', 'Alex'),
    cbind('Don',   'hates', 'Chris'),
    cbind('Chris', 'hates', 'Bob'),
    cbind('Bob',   'hates', 'Chris'),
    cbind('Elly',  'hates', 'Chris'),
    cbind('Elly',  'hates', 'Bob'),
    cbind('Elly',  'loves', 'Alex')
    )
######
# form tensor as a set of frontal slices (Predicate mode)
    tnsr=getTensor(trp)
    trp_=tnsr2trp(tnsr)
    #print(any(! paste(trp_[,1],trp_[,2],trp_[,3]) %in% paste(trp[,1],trp[,2],trp[,3])))
    #print(any(! paste(trp[,1],trp[,2],trp[,3]) %in% paste(trp_[,1],trp_[,2],trp_[,3])))



