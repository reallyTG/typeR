library(blocksdesign)


### Name: design
### Title: General block and treatment designs.
### Aliases: design

### ** Examples


## For optimum results, the number of searches may need to be increased in practice.

## 4 replicates of 12 treatments with 16 nested blocks of size 3
# rectangular lattice see Plan 10.10 Cochran and Cox 1957.
treatments = factor(1:12)
blocks = data.frame(Main = gl(4,12), Sub = gl(16,3))
design(treatments,blocks)$blocks_model

## 4 x 12 design for 4 replicates of 12 treatments with 3 plots in each intersection block
## The optimal design is Trojan with known A-efficiency = 22/31 for the intersection blocks
treatments = factor(1:12)
blocks = data.frame(Rows = gl(4,12), Cols = gl(4,3,48))
design(treatments,blocks)$blocks_model

## 4 x 12 design for 4 replicates of 12 treatments with 3 sub-column blocks nested 
## as above but showing 3 sub-columns nested within each main column
treatments = factor(1:12)
blocks = data.frame(Rows = gl(4,12), Cols = gl(4,3,48), subCols = gl(12,1,48))
## No test: 
design(treatments,blocks,searches=200)$blocks_model
## End(No test)

## 4 x 13 Row-and-column design for 4 replicates of 13 treatments 
## Youden design Plan 13.5 Cochran and Cox (1957).
treatments = factor(1:13)
blocks = data.frame(Rows = gl(4,13), Cols = gl(13,1,52))
## No test: 
design(treatments,blocks,searches = 700)
## End(No test)

## Durban - 272 treatments in a 16 x 34 design with nested rows-and-columns
data(durban) 
durban=durban[c(3,1,2,4,5)]
durban=durban[ do.call(order, durban), ]
treatments=data.frame(gen=durban$gen)
Reps = factor(rep(1:2,each=272))
Rows = factor(rep(1:16,each=34))
Col1 = factor(rep(rep(1:4,c(9,8,8,9)),16))
Col2 = factor(rep(rep(1:8,c(5,4,4,4,4,4,4,5)),16))
Col3 = factor(rep(1:34,16))
blocks = data.frame(Reps,Rows,Col1,Col2,Col3)
## No test: 
design(treatments,blocks,searches=1)$blocks_model
## Finds post-blocked efficiency factors of original design; Durban et al (2003)
blockEfficiencies(treatments,blocks)
## End(No test) 

## differential replication 
treatments=factor(c(rep(1:12,2),rep(13,12)))
blocks = data.frame(Main = gl(2,18),  Sub = gl(12,3,36))
design(treatments,blocks,searches = 5)

## 48 treatments in 2 replicate blocks of size 48 for a 24 x 4 array 
## with 2 main rows and 3 main columns the cols factor must precede 
## the rows factor otherwise the design will confound one treatment contrast
## in the replicates.rows x columns interactions due to inherent aliasing 
treatments=factor(1:48)
blocks = data.frame(Reps = gl(2,48),Cols = gl(3,8,96),Rows = gl(2,24,96))
design(treatments,blocks,searches=5)

## Factorial treatment designs defined by a factorial model equation.

## Main effects of five 2-level factors in a half-fraction in 2/2/2 nested blocks design 
## (may require many repeats to find a fully orthogonal solution)
treatments = expand.grid(F1 = factor(1:2), F2 = factor(1:2),
 F3 = factor(1:2), F4 = factor(1:2), F5 = factor(1:2))
blocks = data.frame(b1 = gl(2,8),b2 = gl(4,4),b3 = gl(8,2))
model="F1 + F2 + F3 + F4 + F5"
## No test: 
repeat {z = design(treatments,blocks,treatments_model=model,searches=50)
if ( isTRUE(all.equal(z$blocks_model[3,3],1) ) ) break }
 print(z)
## End(No test)
 
# Second-order model for five qualitative 2-level factors in 4 randomized blocks
treatments = expand.grid(F1 = factor(1:2), F2 = factor(1:2), F3 = factor(1:2), 
F4 = factor(1:2), F5 = factor(1:2))
blocks = data.frame(blocks = gl(4,8))
model = "(F1 + F2 + F3 + F4 + F5)^2"
design(treatments,blocks,treatments_model=model,searches = 10)

# Main effects of five 2-level factors in a half-fraction of 
# a 4 x 4 row-and column design.
treatments = expand.grid(F1 = factor(1:2), F2 = factor(1:2), F3 = factor(1:2), 
F4 = factor(1:2), F5 = factor(1:2))
blocks = data.frame(rows = gl(4,4), cols = gl(4,1,16))
model = "~ F1 + F2 + F3 + F4 + F5"
## No test: 
repeat {z = design(treatments,blocks,treatments_model=model,searches=50)
if ( isTRUE(all.equal(z$blocks_model[2,3],1) ) ) break }
 print(z)
## End(No test)

# Quadratic regression for three 3-level numeric factor assuming a 10/27 fraction
treatments = expand.grid(A = 1:3, B = 1:3, C = 1:3)
blocks=data.frame(main=gl(1,10))
model = " ~ ( A + B + C)^2 + I(A^2) + I(B^2) + I(C^2)"
design(treatments,blocks,treatments_model=model,searches=5) 

# First-order model for 1/3rd fraction of four qualitative 3-level factors in 3  blocks
treatments = expand.grid(F1 = factor(1:3), F2 = factor(1:3), F3 = factor(1:3), 
F4 = factor(1:3))
blocks = data.frame(main = gl(3,9))
model = " ~ F1 + F2 + F3 + F4"
design(treatments,blocks,treatments_model=model,searches=25)

# Second-order model for a 1/3rd fraction of five qualitative 3-level factors in 3 blocks
# (may require many repeats to find a fully orthogonal solution)
treatments = expand.grid(F1 = factor(1:3), F2 = factor(1:3), F3 = factor(1:3), 
F4 = factor(1:3), F5 = factor(1:3))
blocks=data.frame(main=gl(3,27))
model = " ~ (F1 + F2 + F3 + F4 + F5)^2"
## No test: 
 repeat {z = design(treatments,blocks,treatments_model=model,searches=50)
if ( isTRUE(all.equal(z$blocks_model[1,3],1) ) ) break}
 print(z)
## End(No test)

# Second-order model for two qualitative and two quantitative level factors in 4 blocks
treatments = expand.grid(F1 = factor(1:2), F2 = factor(1:3), V1 = 1:3, V2 = 1:4)
blocks = data.frame(main = gl(4,18))
model = " ~ F1 + F2 + poly(V1,2) + poly(V2,2) + (poly(V1,1) + F1 + F2):(poly(V2,1) + F1 + F2)"
## No test: 
design(treatments,blocks,treatments_model=model,searches=5)
## End(No test)
 
# Plackett and Burman design for eleven 2-level factors in 12 runs 
GF = expand.grid(F1 = factor(1:2,labels=c("a","b")), F2 = factor(1:2,labels=c("a","b")), 
                 F3 = factor(1:2,labels=c("a","b")), F4 = factor(1:2,labels=c("a","b")),
                 F5 = factor(1:2,labels=c("a","b")), F6 = factor(1:2,labels=c("a","b")),
                 F7 = factor(1:2,labels=c("a","b")), F8 = factor(1:2,labels=c("a","b")), 
                 F9 = factor(1:2,labels=c("a","b")), F10= factor(1:2,labels=c("a","b")), 
                 F11= factor(1:2,labels=c("a","b")) )
blocks=data.frame(main=gl(1,12))
model = "~ F1 + F2 + F3 + F4 + F5 + F6 + F7 + F8 + F9 + F10 + F11"
## No test: 
design(GF,blocks,treatments_model=model,searches=25)
## End(No test)




