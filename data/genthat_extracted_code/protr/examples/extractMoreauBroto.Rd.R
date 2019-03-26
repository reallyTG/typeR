library(protr)


### Name: extractMoreauBroto
### Title: Normalized Moreau-Broto Autocorrelation Descriptor
### Aliases: extractMoreauBroto
### Keywords: Moreau-Broto autocorrelation extract normalized

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
extractMoreauBroto(x)

myprops = data.frame(
  AccNo = c("MyProp1", "MyProp2", "MyProp3"),
  A = c(0.62,  -0.5, 15),  R = c(-2.53,   3, 101),
  N = c(-0.78,  0.2, 58),  D = c(-0.9,    3, 59),
  C = c(0.29,    -1, 47),  E = c(-0.74,   3, 73),
  Q = c(-0.85,  0.2, 72),  G = c(0.48,    0, 1),
  H = c(-0.4,  -0.5, 82),  I = c(1.38, -1.8, 57),
  L = c(1.06,  -1.8, 57),  K = c(-1.5,    3, 73),
  M = c(0.64,  -1.3, 75),  F = c(1.19, -2.5, 91),
  P = c(0.12,     0, 42),  S = c(-0.18, 0.3, 31),
  T = c(-0.05, -0.4, 45),  W = c(0.81, -3.4, 130),
  Y = c(0.26,  -2.3, 107), V = c(1.08, -1.5, 43))

# Use 4 properties in the AAindex database, and 3 cutomized properties
extractMoreauBroto(
  x, customprops = myprops,
  props = c(
    "CIDH920105", "BHAR880101",
    "CHAM820101", "CHAM820102",
    "MyProp1", "MyProp2", "MyProp3")
)



