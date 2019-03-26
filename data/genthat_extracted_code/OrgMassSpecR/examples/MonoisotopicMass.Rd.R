library(OrgMassSpecR)


### Name: MonoisotopicMass
### Title: Calculate the monoisotopic mass or monoisotopic m/z value of an
###   organic molecule.
### Aliases: MonoisotopicMass

### ** Examples

## monoisotopic m/z of creatinine (C4H7N3O), +1 charge
## unlabeled
MonoisotopicMass(formula = list(C=4, H=7, N=3, O=1), charge = 1)
## with all carbon-13 atoms
MonoisotopicMass(formula = list(C=4, H=7, N=3, O=1), 
                 isotopes = list(C = 13.0033548378),
                 charge = 1) 
## with 2 carbon-12 atoms and 2 carbon-13 atoms
MonoisotopicMass(formula = list(C=2, H=7, N=3, O=1, x=2), 
                 isotopes = list(x = 13.0033548378),
                 charge = 1)

## monoisotopic mass of cyanocobalamin (C63H88CoN14O14P)
MonoisotopicMass(formula = list(C=63, H=88, N=14, O=14, P=1, x=1),
                 isotopes = list(x = 58.9332002))



