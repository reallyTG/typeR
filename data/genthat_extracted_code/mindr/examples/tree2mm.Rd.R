library(mindr)


### Name: tree2mm
### Title: Convert a directory tree to a mindmap file.
### Aliases: tree2mm

### ** Examples

et2 <- c("/Root name", "/Path A", "/Path A/Product A", "/Path A/Product A/Process A", 
    "/Path A/Product A/Process A/Step A", "/Path A/Product A/Process A/Step A/Record 1", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses/Object 1", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses/Object 1/Type: data source", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses/Object 1/Version: 3", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses/Object 2", 
    "/Path A/Product A/Process A/Step A/Record 1/Analyses/Object 3", 
    "/Path A/Product A/Process A/Step A/Record 1/Setup Parts", 
    "/Path A/Product A/Process A/Step A/Record 1/Setup Parts/Par 1", 
    "/Path A/Product A/Process A/Step A/Record 1/Setup Parts/Par 2", 
    "/Path A/Product A/Process A/Step A/Record 1/Setup Parts/Par 3", 
    "/Path B", "/Path C")
tree2mm(et2)



