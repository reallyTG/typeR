library(D3GB)


### Name: createAssembly
### Title: Creates a genome assembly for 'genomebrowser' or 'genomemap'.
### Aliases: createAssembly

### ** Examples

# A Micromonospora scaffolds' names and sizes
scaffolds <- c("NZ_HF570105.1", "NZ_HF570106.1", "NZ_HF570107.1", "NZ_HF570108.1")
sizes <- c(583, 1327, 241394, 7082520)

# Create an assembly
createAssembly(scaffolds, sizes)



