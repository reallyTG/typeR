library(OrgMassSpecR)


### Name: MolecularWeight
### Title: Calculate the molecular weight of an organic molecule.
### Aliases: MolecularWeight

### ** Examples

MolecularWeight(formula = list(C=2, H=4))

## Molecular weight of cyanocobalamin (C63H88CoN14O14P) with user defined cobalt
MolecularWeight(formula = list(C=63, H=88, N=14, O=14, P=1, x=1),
                amu = list(x = 58.933200))
                
## Molecular weight of triiodothyronine (C15H12I3NO4) using output from ListFormula
MolecularWeight(formula = ListFormula("C15H12I3NO4"))               



