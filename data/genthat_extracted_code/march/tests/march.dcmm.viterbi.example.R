# Estimation of a DCMM  
set.seed(327)
# Computation of a the simplest DCMM model
model <- march.dcmm.construct(y=pewee,orderHC=1,orderVC=1,M=2,popSize=1,gen=1)
# Extraction of the best sequence of hidden states using the Viterbi algorithm.
bestSeq <- march.dcmm.viterbi(model,pewee)
print(bestSeq)
