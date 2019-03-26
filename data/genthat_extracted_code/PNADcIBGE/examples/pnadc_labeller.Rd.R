library(PNADcIBGE)


### Name: pnadc_labeller
### Title: Label categorical variables from PNADC datasets
### Aliases: pnadc_labeller

### ** Examples

input_path <- pnadc_example("input_example.txt")
data_path <- pnadc_example("exampledata.txt")
dictionary.path <- pnadc_example("dictionaryexample.xls")
pnadc.df <- read_pnadc(data_path, input_path, vars="VD4002")
pnadc.df <- pnadc_labeller(pnadc.df,dictionary.path)




