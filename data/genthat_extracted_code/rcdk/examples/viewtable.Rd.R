library(rcdk)


### Name: view.table
### Title: View 2D Structures With Data
### Aliases: view.table
### Keywords: programming

### ** Examples

smiles <- c('CCC', 'CCN', 'CCN(C)(C)',
            'c1ccccc1Cc1ccccc1',
            'C1CCC1CC(CN(C)(C))CC(=O)CC')
mols <- parse.smiles(smiles)
dframe <- data.frame(x = runif(4),
                     toxicity = factor(c('Toxic', 'Toxic', 'Nontoxic', 'Nontoxic')),
                     solubility = c('yes', 'yes', 'no', 'yes'))
## Not run: view.table(mols[1:4], dframe)



