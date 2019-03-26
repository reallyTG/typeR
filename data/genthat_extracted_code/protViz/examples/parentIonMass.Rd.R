library(protViz)


### Name: parentIonMass
### Title: Compute Parent Ion Mass of a Peptide Sequence
### Aliases: parentIonMass pim pepmass

### ** Examples

        
        fetuin<-list( sequence=c('MK', 'SFVLLFCLAQLWGCHSIPLDPVAGYK',
        'EPACDDPDTEQAALAAVDYINK',
        'HLPR', 'GYK', 'HTLNQIDSVK', 'VWPR',
        'RPTGEVYDIEIDTLETTCHVLDPTPLANCSVR',
        'QQTQHAVEGDCDIHVLK', 'QDGQFSVLFTK',
        'CDSSPDSAEDVR', 'K', 'LCPDCPLLAPLNDSR',
        'VVHAVEVALATFNAESNGSYLQLVEISR',
        'AQFVPLPVSVSVEFAVAATDCIAK',
        'EVVDPTK', 'CNLLAEK', 'QYGFCK',
        'GSVIQK', 'ALGGEDVR',
        'VTCTLFQTQPVIPQPQPDGAEAEAPSAVPDAAGPTPSAAGPPVASVVVGPSVVAVPLPLHR',
        'AHYDLR', 'HTFSGVASVESSSGEAFHVGK',
        'TPIVGQPSIPGGPVR', 'LCPGR', 'IR', 'YFK', 'I'),
        description=
            "FETUA_BOVIN Alpha-2-HS-glycoprotein ")

        plot(peptideMass<-parentIonMass(sequence=fetuin$sequence), 
            sub=list(fetuin$description, cex=0.75), 
            main="tryptic digested peptides")


        AA<-c(71.037114, 114.534940, 160.030649, 115.026943, 129.042593, 147.068414, 
            57.021464, 137.058912, 113.084064, 0.000000, 128.094963, 113.084064, 
            131.040485, 114.042927, 0.000000, 97.052764, 128.058578, 156.101111, 
            87.032028, 101.047679, 150.953630, 99.068414, 186.079313, 111.000000, 
            163.063329, 128.550590)

        parentIonMass(c("ELVIS", "ELVISK"), fixmod=AA)



