library(MultiMeta)


### Name: multi_meta
### Title: Meta-analysis of multivariate GWAS results
### Aliases: multi_meta

### ** Examples

file1=system.file("extdata", "Example_file_1.txt", package="MultiMeta")
file2=system.file("extdata", "Example_file_2.txt", package="MultiMeta")
multi_meta(files=c(file1,file2), N=c(1200,600), sep=" ",
output.file="Output_from_running_example.txt")



