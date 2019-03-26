### R code from vignette source 'PhyloSim.Rnw'

###################################################
### code chunk number 1: PhyloSim.Rnw:57-58
###################################################
options(width=90)


###################################################
### code chunk number 2: PhyloSim.Rnw:60-62
###################################################
library(phylosim)
set.seed(833)


###################################################
### code chunk number 3: PhyloSim.Rnw:66-68
###################################################
cat("((t1:0.3,t2:0.3):0.2,t3:0.1);",file="3taxa.nwk")
cat("((t1:0.3,t2:0.3):0.2,(t3:0.1,t4:0.1):0.4);",file="4taxa.nwk")


###################################################
### code chunk number 4: PhyloSim.Rnw:79-83
###################################################
Simulate(PhyloSim(
	root.seq=sampleStates( NucleotideSequence(len=50,proc=list(list(JC69())) )),
	phylo=read.tree("3taxa.nwk")
))$alignment


###################################################
### code chunk number 5: PhyloSim.Rnw:89-90
###################################################
root.seq<-NucleotideSequence(length=50)


###################################################
### code chunk number 6: PhyloSim.Rnw:94-95
###################################################
print(root.seq)


###################################################
### code chunk number 7: PhyloSim.Rnw:100-101
###################################################
p<-JC69()


###################################################
### code chunk number 8: PhyloSim.Rnw:105-106
###################################################
attachProcess(root.seq,p)


###################################################
### code chunk number 9: PhyloSim.Rnw:111-112
###################################################
sampleStates(root.seq)


###################################################
### code chunk number 10: PhyloSim.Rnw:116-117
###################################################
print(root.seq)


###################################################
### code chunk number 11: PhyloSim.Rnw:121-122
###################################################
tree<-read.tree("3taxa.nwk")


###################################################
### code chunk number 12: PhyloSim.Rnw:127-128
###################################################
plot(tree)


###################################################
### code chunk number 13: PhyloSim.Rnw:132-133
###################################################
sim<-PhyloSim()


###################################################
### code chunk number 14: PhyloSim.Rnw:137-138
###################################################
sim$phylo<-tree


###################################################
### code chunk number 15: PhyloSim.Rnw:142-143
###################################################
sim$rootSeq<-root.seq


###################################################
### code chunk number 16: PhyloSim.Rnw:147-148
###################################################
Simulate(sim)


###################################################
### code chunk number 17: PhyloSim.Rnw:152-153
###################################################
sim$alignment


###################################################
### code chunk number 18: PhyloSim.Rnw:159-162
###################################################
p<-HKY(rate.params=list( "Alpha"=10,"Beta"=2),
                     base.freqs=c(4,3,2,1)/10
   )


###################################################
### code chunk number 19: PhyloSim.Rnw:166-167
###################################################
plot(p,scale=0.5)


###################################################
### code chunk number 20: PhyloSim.Rnw:172-174
###################################################
root.len50.seq<-NucleotideSequence(length=50,processes=list(list(p)))
sampleStates(root.len50.seq)


###################################################
### code chunk number 21: PhyloSim.Rnw:178-179
###################################################
print(root.len50.seq)


###################################################
### code chunk number 22: PhyloSim.Rnw:183-187
###################################################
sim<-PhyloSim(
	root.seq=root.len50.seq,
	phylo=read.tree("3taxa.nwk")
);


###################################################
### code chunk number 23: PhyloSim.Rnw:191-192
###################################################
Simulate(sim)


###################################################
### code chunk number 24: PhyloSim.Rnw:196-197
###################################################
saveAlignment(sim,file="HKY_sim.fas")


###################################################
### code chunk number 25: PhyloSim.Rnw:199-200
###################################################
unlink("HKY_sim.fas")


###################################################
### code chunk number 26: PhyloSim.Rnw:204-205
###################################################
plot(sim,num.pages=1)


###################################################
### code chunk number 27: PhyloSim.Rnw:214-221
###################################################
         p<-GTR(
                     rate.params=list(
                             "a"=1, "b"=2, "c"=3,
                             "d"=1, "e"=2, "f"=3
                     ),
                     base.freqs=c(2,2,1,1)/6
             )


###################################################
### code chunk number 28: PhyloSim.Rnw:225-226
###################################################
summary(p)


###################################################
### code chunk number 29: PhyloSim.Rnw:231-232
###################################################
root.seq<-NucleotideSequence(length=50,processes=list( list(p) ))


###################################################
### code chunk number 30: PhyloSim.Rnw:238-239
###################################################
plusGamma(root.seq,p,0.5)


###################################################
### code chunk number 31: PhyloSim.Rnw:243-244
###################################################
getRateMultipliers(root.seq,p);


###################################################
### code chunk number 32: PhyloSim.Rnw:248-252
###################################################
sim<-PhyloSim(
	root.seq=sampleStates(root.seq),
	phylo=read.tree("3taxa.nwk")
)


###################################################
### code chunk number 33: PhyloSim.Rnw:256-257
###################################################
Simulate(sim)


###################################################
### code chunk number 34: PhyloSim.Rnw:261-262
###################################################
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 35: PhyloSim.Rnw:266-267
###################################################
saveAlignment(sim,file="Gamma_sim.fas",skip.internal=TRUE)


###################################################
### code chunk number 36: PhyloSim.Rnw:269-270
###################################################
file.remove("Gamma_sim.fas")


###################################################
### code chunk number 37: PhyloSim.Rnw:279-281
###################################################
clearStates(root.seq)
sampleStates(root.seq)


###################################################
### code chunk number 38: PhyloSim.Rnw:285-286
###################################################
plusInvGamma(root.seq,p,pinv=0.8,shape=0.5)


###################################################
### code chunk number 39: PhyloSim.Rnw:290-297
###################################################
sim<-Simulate(
	PhyloSim(
		root.seq=root.seq,
		phylo=rcoal(3)
	)
)
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 40: PhyloSim.Rnw:301-302
###################################################
saveAlignment(sim,file="InvGamma_sim.fas",skip.internal=TRUE)


###################################################
### code chunk number 41: PhyloSim.Rnw:304-305
###################################################
file.remove("InvGamma_sim.fas")


###################################################
### code chunk number 42: PhyloSim.Rnw:313-316
###################################################
p<-JC69()
root.seq<-NucleotideSequence(len=50,processes=list(list(p)))
sampleStates(root.seq)


###################################################
### code chunk number 43: PhyloSim.Rnw:321-326
###################################################
 d<-DiscreteDeletor(
                     rate=0.25,
                     sizes=c(1,2),
                     probs=c(1/2,1/2)
   )


###################################################
### code chunk number 44: PhyloSim.Rnw:331-336
###################################################
 i<-DiscreteInsertor(
                     rate=0.25,
                     sizes=c(1,2),
                     probs=c(1/2,1/2)
   )


###################################################
### code chunk number 45: PhyloSim.Rnw:340-341
###################################################
i$templateSeq<-NucleotideSequence(length=2,processes=list( list(p) ))


###################################################
### code chunk number 46: PhyloSim.Rnw:349-351
###################################################
attachProcess(root.seq,d)
attachProcess(root.seq,i)


###################################################
### code chunk number 47: PhyloSim.Rnw:355-359
###################################################
sim<-Simulate(PhyloSim(
	root.seq=root.seq,
	phylo=rcoal(3)
))


###################################################
### code chunk number 48: PhyloSim.Rnw:363-364
###################################################
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 49: PhyloSim.Rnw:368-369
###################################################
saveAlignment(sim,file="indel1_sim.fas",skip.internal=TRUE)


###################################################
### code chunk number 50: PhyloSim.Rnw:371-372
###################################################
file.remove("indel1_sim.fas")


###################################################
### code chunk number 51: PhyloSim.Rnw:382-388
###################################################
 i2<-DiscreteInsertor(
                     rate=0.25,
                     sizes=c(1,2,3,4),
                     probs=c(1,2,3,4)/10,
		     template.seq=NucleotideSequence(string="C")	
   )


###################################################
### code chunk number 52: PhyloSim.Rnw:392-393
###################################################
clearStates(root.seq)


###################################################
### code chunk number 53: PhyloSim.Rnw:398-399
###################################################
root.seq$processes<-list(list(i2, d, p))


###################################################
### code chunk number 54: PhyloSim.Rnw:403-407
###################################################
sim<-Simulate(PhyloSim(
	root.seq=sampleStates(root.seq),
	phylo=read.tree("3taxa.nwk")
))


###################################################
### code chunk number 55: PhyloSim.Rnw:411-412
###################################################
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 56: PhyloSim.Rnw:416-417
###################################################
saveAlignment(sim,file="indel2_sim.fas",skip.internal=TRUE)


###################################################
### code chunk number 57: PhyloSim.Rnw:419-420
###################################################
file.remove("indel2_sim.fas")


###################################################
### code chunk number 58: PhyloSim.Rnw:426-429
###################################################
p<-JC69()
root.seq<-NucleotideSequence(len=100,processes=list(list(p)))
sampleStates(root.seq)


###################################################
### code chunk number 59: PhyloSim.Rnw:434-439
###################################################
d<-DiscreteDeletor(
                     rate=1,
                     sizes=c(1,2,3),
                     probs=c(3/6,2/6,1/6)
)


###################################################
### code chunk number 60: PhyloSim.Rnw:444-449
###################################################
i<-DiscreteInsertor(
                     rate=1,
                     sizes=c(1,2,3),
                     probs=c(3/6,2/6,1/6)
)


###################################################
### code chunk number 61: PhyloSim.Rnw:453-454
###################################################
i$templateSeq<-NucleotideSequence(length=2,processes=list( list(p) ))


###################################################
### code chunk number 62: PhyloSim.Rnw:458-460
###################################################
attachProcess(root.seq,d)
attachProcess(root.seq,i)


###################################################
### code chunk number 63: PhyloSim.Rnw:464-465
###################################################
setDeletionTolerance(root.seq,d,0.08 + c(1/2:51,1/51:2))


###################################################
### code chunk number 64: PhyloSim.Rnw:469-470
###################################################
plotParametersAtSites(root.seq,d,"deletion.tolerance")


###################################################
### code chunk number 65: PhyloSim.Rnw:474-475
###################################################
setInsertionTolerance(root.seq,i,0.08 + c(1/2:51,1/51:2))


###################################################
### code chunk number 66: PhyloSim.Rnw:479-483
###################################################
sim<-Simulate(PhyloSim(
        root.seq=root.seq,
        phylo=read.tree("4taxa.nwk")
))


###################################################
### code chunk number 67: PhyloSim.Rnw:487-488
###################################################
plot(sim,plot.ancestors=FALSE)


###################################################
### code chunk number 68: PhyloSim.Rnw:492-493
###################################################
saveAlignment(sim,file="indel3_sim.fas",skip.internal=TRUE)


###################################################
### code chunk number 69: PhyloSim.Rnw:495-496
###################################################
file.remove("indel3_sim.fas")


###################################################
### code chunk number 70: PhyloSim.Rnw:516-520
###################################################
jc69<-JC69()
hky<-HKY(rate.params=list( "Alpha"=5,"Beta"=2),
                     base.freqs=c(4,3,2,1)/10
      )


###################################################
### code chunk number 71: PhyloSim.Rnw:524-525
###################################################
root.seq<-NucleotideSequence(length=100)


###################################################
### code chunk number 72: PhyloSim.Rnw:529-530
###################################################
attachProcess(root.seq,jc69,1:50)


###################################################
### code chunk number 73: PhyloSim.Rnw:534-535
###################################################
attachProcess(root.seq,hky,51:100)


###################################################
### code chunk number 74: PhyloSim.Rnw:539-544
###################################################
plusGamma(root.seq,jc69,1,1:25)
plusGamma(root.seq,jc69,0.5,26:50)

plusGamma(root.seq,hky,1,51:75)
plusGamma(root.seq,hky,0.5,76:100)


###################################################
### code chunk number 75: PhyloSim.Rnw:548-552
###################################################
sim<-Simulate(PhyloSim(
	root.seq=sampleStates(root.seq),
	phylo=rcoal(3)
))


###################################################
### code chunk number 76: PhyloSim.Rnw:556-557
###################################################
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 77: PhyloSim.Rnw:563-565
###################################################
p<-F84(base.freqs=c(1,2,3,4));
p$kappa<-1;


###################################################
### code chunk number 78: PhyloSim.Rnw:569-570
###################################################
root.seq<-NucleotideSequence(length=50,processes=list(list(p)));


###################################################
### code chunk number 79: PhyloSim.Rnw:574-575
###################################################
plusGamma(root.seq,p,1)


###################################################
### code chunk number 80: PhyloSim.Rnw:579-580
###################################################
tree<-read.tree("4taxa.nwk")


###################################################
### code chunk number 81: PhyloSim.Rnw:585-589
###################################################
sim<-PhyloSim(
	root.seq=sampleStates(root.seq),
	phylo=tree
)


###################################################
### code chunk number 82: PhyloSim.Rnw:600-610
###################################################
node.hook <- function(seq) {

	if(!isAttached(seq$sites[[1]],p)){
		return(seq);
	}

	cat("Resampling rate multipliers!\n");
	plusGamma(seq,p,1)
	return(seq)
}


###################################################
### code chunk number 83: PhyloSim.Rnw:614-615
###################################################
plot(sim)


###################################################
### code chunk number 84: PhyloSim.Rnw:621-622
###################################################
attachHookToNode(sim, node = 6, fun = node.hook)


###################################################
### code chunk number 85: PhyloSim.Rnw:626-627
###################################################
Simulate(sim)


###################################################
### code chunk number 86: PhyloSim.Rnw:631-632
###################################################
plot(sim,num.pages=1,plot.ancestors=FALSE)


###################################################
### code chunk number 87: PhyloSim.Rnw:644-647
###################################################
p<-JC69();
root.seq<-NucleotideSequence(length=10)
attachProcess(root.seq,p)


###################################################
### code chunk number 88: PhyloSim.Rnw:651-652
###################################################
tree<-read.tree("3taxa.nwk");


###################################################
### code chunk number 89: PhyloSim.Rnw:656-670
###################################################
for(i in 1:3){
	cat(paste("\n\nSimulating replication ",i,"\n\n",sep=""))	

	clearStates(root.seq)
	plusGamma(root.seq,p,0.25)
	sampleStates(root.seq)

	sim<-Simulate(PhyloSim(
		root.seq=root.seq,
		phylo=tree	
	))	
	
	saveAlignment(sim,file=paste("aln_",i,".fas",sep=""))
}


###################################################
### code chunk number 90: PhyloSim.Rnw:673-676
###################################################
unlink("aln_1.fas");
unlink("aln_2.fas");
unlink("aln_3.fas");


###################################################
### code chunk number 91: PhyloSim.Rnw:691-694
###################################################
p<-JC69();
root.seq<-NucleotideSequence(length=50)
attachProcess(root.seq,p)


###################################################
### code chunk number 92: PhyloSim.Rnw:698-699
###################################################
tree<-read.tree("3taxa.nwk");


###################################################
### code chunk number 93: PhyloSim.Rnw:703-721
###################################################
sim.replicate<-function(i){
        name<-paste("replication_",i,sep="")
        clearStates(root.seq)
        plusGamma(root.seq,p,0.25)
        sampleStates(root.seq)

        sim<-Simulate(PhyloSim(
                name=name,
                root.seq=root.seq,
                phylo=tree,
        ),
            quiet=TRUE
        )

        saveAlignment(sim,file=paste("aln_",i,".fas",sep=""))
        return(sim)
        # return(TRUE)
}


###################################################
### code chunk number 94: PhyloSim.Rnw:732-737
###################################################
have.mcore <-  is.element("parallel", installed.packages()[,1])

if(have.mcore){
    library(parallel)
}


###################################################
### code chunk number 95: PhyloSim.Rnw:741-746
###################################################
if(have.mcore){
    nr.replicates<-3
    res.objects<-mclapply(1:nr.replicates, sim.replicate)
    print(res.objects)
}


###################################################
### code chunk number 96: PhyloSim.Rnw:750-754
###################################################
if(have.mcore){
    print(res.objects[[1]]$alignment)
} 



###################################################
### code chunk number 97: PhyloSim.Rnw:757-763
###################################################
unlink("aln_1.fas");
unlink("aln_2.fas");
unlink("aln_3.fas");

unlink("3taxa.nwk");
unlink("4taxa.nwk");


###################################################
### code chunk number 98: PhyloSim.Rnw:769-770
###################################################
cat("(((t2:0.1231,t4:0.1231):0.2131,(t3:0.0284,t5:0.0284):0.3078):0.1698,t1:0.5060);",file="smalldemotree.nwk")


###################################################
### code chunk number 99: PhyloSim.Rnw:778-779
###################################################
ll(Site())


###################################################
### code chunk number 100: PhyloSim.Rnw:783-784
###################################################
PSIM_FAST <- TRUE


###################################################
### code chunk number 101: PhyloSim.Rnw:787-791
###################################################
wag <- WAG()
jtt <- JTT()
lg <- LG()
pam <- PAM()


###################################################
### code chunk number 102: PhyloSim.Rnw:794-795
###################################################
summary(wag)


###################################################
### code chunk number 103: PhyloSim.Rnw:798-799
###################################################
plot(wag, scale = 0.8)


###################################################
### code chunk number 104: PhyloSim.Rnw:803-805
###################################################
cont.del <- ContinuousDeletor(rate = 0.6, max.length = 10, 
    dist = expression(rnorm(1, mean = 5, sd = 3)))


###################################################
### code chunk number 105: PhyloSim.Rnw:808-809
###################################################
templ.seq.wag <- AminoAcidSequence(length = 10)


###################################################
### code chunk number 106: PhyloSim.Rnw:813-814
###################################################
templ.seq.lg <- clone(templ.seq.wag)


###################################################
### code chunk number 107: PhyloSim.Rnw:818-820
###################################################
cont.ins.wag <- ContinuousInsertor(rate = 0.6, max.length = 10, 
    dist = expression(rnorm(1, mean = 5, sd = 3)))


###################################################
### code chunk number 108: PhyloSim.Rnw:824-826
###################################################
cont.ins.lg <- ContinuousInsertor(rate = 0.6, max.length = 10, 
    dist = expression(rnorm(1, mean = 5, sd = 3)))


###################################################
### code chunk number 109: PhyloSim.Rnw:830-835
###################################################
processes.site.wag<-list(wag, cont.ins.wag, cont.del)
processes.site.lg<-list(lg, cont.ins.lg, cont.del)

templ.seq.wag$processes <- list(processes.site.wag)
templ.seq.lg$processes <- list(processes.site.lg)


###################################################
### code chunk number 110: PhyloSim.Rnw:841-843
###################################################
cont.ins.wag$writeProtected <- FALSE
cont.ins.lg$writeProtected <- FALSE


###################################################
### code chunk number 111: PhyloSim.Rnw:847-849
###################################################
cont.ins.wag$templateSeq <- templ.seq.wag
cont.ins.lg$templateSeq <- templ.seq.lg


###################################################
### code chunk number 112: PhyloSim.Rnw:859-869
###################################################
cont.ins.wag$insertHook <- function(seq, target.seq, event.pos, 
    insert.pos) {
    plusInvGamma(seq, process = wag, pinv = 0.1, shape = 1)
    return(seq)
}
cont.ins.lg$insertHook <- function(seq, target.seq, event.pos, 
    insert.pos) {
    plusInvGamma(seq, process = lg, pinv = 0.1, shape = 1)
    return(seq)
}


###################################################
### code chunk number 113: PhyloSim.Rnw:874-875
###################################################
aa.seq <- AminoAcidSequence(length = 60)


###################################################
### code chunk number 114: PhyloSim.Rnw:882-885
###################################################
process.pattern <- c(rep(list(list(wag, cont.del, cont.ins.wag)), 
    times = 20), rep(list(list(jtt)), times = 20), rep(list(list(lg, 
    cont.del, cont.ins.lg)), times = 20))


###################################################
### code chunk number 115: PhyloSim.Rnw:889-890
###################################################
aa.seq$processes <- process.pattern


###################################################
### code chunk number 116: PhyloSim.Rnw:895-908
###################################################
for (i in 1:aa.seq$length) {
    if (isAttached(aa.seq$sites[[i]], jtt)) {
        setRateMultipliers(aa.seq, jtt, qnorm(runif(1,min=0.5,max=1),mean=0.001,sd=0.01), index = i)
    }
    else if (isAttached(aa.seq$sites[[i]], wag)) {
        plusInvGamma(aa.seq, process = wag, pinv = 0.1, shape = 1, 
            index = i)
    }
    else if (isAttached(aa.seq$sites[[i]], lg)) {
        plusInvGamma(aa.seq, process = lg, pinv = 0.1, shape = 1, 
            index = i)
    }
}


###################################################
### code chunk number 117: PhyloSim.Rnw:912-914
###################################################
sampleStates(aa.seq)
print(aa.seq)


###################################################
### code chunk number 118: PhyloSim.Rnw:918-919
###################################################
plot(aa.seq)


###################################################
### code chunk number 119: PhyloSim.Rnw:923-924
###################################################
tree <- read.tree(file = "smalldemotree.nwk")


###################################################
### code chunk number 120: PhyloSim.Rnw:928-930
###################################################
sim <- PhyloSim(phylo = tree, root.seq = aa.seq)
summary(sim)


###################################################
### code chunk number 121: PhyloSim.Rnw:934-935
###################################################
plot(sim)


###################################################
### code chunk number 122: PhyloSim.Rnw:945-953
###################################################
node.hook <- function(seq) {
    for (site in seq$sites) {
        if (isAttached(site, jtt)) {
            attachProcess(site, pam)
        }
    }
    return(seq)
}


###################################################
### code chunk number 123: PhyloSim.Rnw:957-958
###################################################
attachHookToNode(sim, node = 8, fun = node.hook)


###################################################
### code chunk number 124: PhyloSim.Rnw:966-967
###################################################
Simulate(sim)


###################################################
### code chunk number 125: PhyloSim.Rnw:971-972
###################################################
saveAlignment(sim, file = "example_V3.1_aln.fas", skip.internal = TRUE)


###################################################
### code chunk number 126: PhyloSim.Rnw:975-976
###################################################
plot(sim,num.pages=1)


###################################################
### code chunk number 127: PhyloSim.Rnw:978-979
###################################################
file.remove("example_V3.1_aln.fas")


###################################################
### code chunk number 128: PhyloSim.Rnw:983-984
###################################################
rm(PSIM_FAST)


###################################################
### code chunk number 129: PhyloSim.Rnw:990-991
###################################################
PSIM_FAST <- TRUE


###################################################
### code chunk number 130: PhyloSim.Rnw:994-995
###################################################
p <- GY94()


###################################################
### code chunk number 131: PhyloSim.Rnw:998-999
###################################################
p$kappa = 2


###################################################
### code chunk number 132: PhyloSim.Rnw:1002-1005
###################################################
codon.freqs <- abs(rnorm(61, mean = 10, sd = 3))
codon.freqs <- codon.freqs/sum(codon.freqs)
p$equDist <- codon.freqs


###################################################
### code chunk number 133: PhyloSim.Rnw:1008-1009
###################################################
summary(p)


###################################################
### code chunk number 134: PhyloSim.Rnw:1013-1014
###################################################
plot(p,scale=0.5)


###################################################
### code chunk number 135: PhyloSim.Rnw:1018-1023
###################################################
d<-DiscreteDeletor(
        rate=1,
        sizes=1:4,
        probs=c(4,3,2,1)/10
);


###################################################
### code chunk number 136: PhyloSim.Rnw:1027-1033
###################################################
i<-DiscreteInsertor(
        rate=1.5,
        sizes=1:4,
        probs=c(4,3,2,1)/10,
        template.seq=CodonSequence(length=4,processes=list(list(p)))
);


###################################################
### code chunk number 137: PhyloSim.Rnw:1037-1038
###################################################
s<-CodonSequence(length=30,processes=list(list(p)))


###################################################
### code chunk number 138: PhyloSim.Rnw:1042-1043
###################################################
omegaVarM3(s,p,omegas=c(0,0.5,1),probs=c(2/4,1/4,1/4))


###################################################
### code chunk number 139: PhyloSim.Rnw:1047-1048
###################################################
plotParametersAtSites(s,p,"omega");


###################################################
### code chunk number 140: PhyloSim.Rnw:1052-1053
###################################################
sampleStates(s)


###################################################
### code chunk number 141: PhyloSim.Rnw:1056-1057
###################################################
sim <- PhyloSim(root.seq = s, phylo = read.tree("smalldemotree.nwk"))


###################################################
### code chunk number 142: PhyloSim.Rnw:1061-1068
###################################################
node.hook <- function(seq) {
	setOmegas(seq, p, 1)
	attachProcess(seq, d)
	attachProcess(seq, i)
	return(seq)
}
attachHookToNode(sim, node = 8, fun = node.hook)


###################################################
### code chunk number 143: PhyloSim.Rnw:1075-1076
###################################################
rm(PSIM_FAST)


###################################################
### code chunk number 144: PhyloSim.Rnw:1080-1081
###################################################
Simulate(sim)


###################################################
### code chunk number 145: PhyloSim.Rnw:1085-1086
###################################################
plot(sim,num.pages=1)


###################################################
### code chunk number 146: PhyloSim.Rnw:1090-1091
###################################################
nsyn.subst<-exportStatTree(sim,"nr.nsyn.subst")


###################################################
### code chunk number 147: PhyloSim.Rnw:1095-1097
###################################################
plot(nsyn.subst)
nodelabels()


###################################################
### code chunk number 148: PhyloSim.Rnw:1101-1102
###################################################
saveAlignment(sim, file = "example_V3.2_aln.fas", )


###################################################
### code chunk number 149: PhyloSim.Rnw:1104-1105
###################################################
file.remove("example_V3.2_aln.fas")


###################################################
### code chunk number 150: PhyloSim.Rnw:1115-1116
###################################################
PSIM_FAST<-TRUE;


###################################################
### code chunk number 151: PhyloSim.Rnw:1120-1121
###################################################
ivd<-DiscreteInsertor(rate=0.06,sizes=c(4,6),probs=c(2/3,1/3));


###################################################
### code chunk number 152: PhyloSim.Rnw:1125-1126
###################################################
ivd$templateSeq<-NucleotideSequence(length=1);


###################################################
### code chunk number 153: PhyloSim.Rnw:1132-1149
###################################################
ivd$generateBy<-function(process=NA,length=NA,target.seq=NA,event.pos=NA,insert.pos=NA){
	# get the target sequence length
	target.length<-target.seq$length;
	# construct a vector with the positions to copy:
	positions<-(insert.pos+1):(insert.pos + length)
	# discard illegal positions:
	positions<-positions[ positions > 0 & positions <= target.length];
	# copy subsequence
	insert<-copySubSequence(target.seq,positions,process);
	# reverse complement sequence,
	# take care, the class of this objects is "Sequence":
	revComp.NucleotideSequence(insert);
	# do not allow nested insertions:
	setRateMultipliers(insert,ivd,0);
	# return insert	
	return(insert);
}


###################################################
### code chunk number 154: PhyloSim.Rnw:1154-1155
###################################################
p<-JC69();


###################################################
### code chunk number 155: PhyloSim.Rnw:1159-1160
###################################################
s<-NucleotideSequence(length=50)


###################################################
### code chunk number 156: PhyloSim.Rnw:1163-1164
###################################################
s$processes<-list(list(p,ivd))


###################################################
### code chunk number 157: PhyloSim.Rnw:1169-1170
###################################################
sampleStates(s)


###################################################
### code chunk number 158: PhyloSim.Rnw:1173-1174
###################################################
detachProcess(s,p)


###################################################
### code chunk number 159: PhyloSim.Rnw:1178-1179
###################################################
plusInvGamma(s,ivd,pinv=0.7,shape=0.5)


###################################################
### code chunk number 160: PhyloSim.Rnw:1182-1183
###################################################
sim<-PhyloSim(root.seq=s, phylo=read.tree("smalldemotree.nwk"));


###################################################
### code chunk number 161: PhyloSim.Rnw:1185-1186
###################################################
file.remove("smalldemotree.nwk");


###################################################
### code chunk number 162: PhyloSim.Rnw:1189-1190
###################################################
Simulate(sim)


###################################################
### code chunk number 163: PhyloSim.Rnw:1193-1194
###################################################
plot(sim,num.pages=1)


###################################################
### code chunk number 164: PhyloSim.Rnw:1198-1199
###################################################
saveAlignment(sim,file="example_V3.3.fas");


###################################################
### code chunk number 165: PhyloSim.Rnw:1201-1202
###################################################
file.remove("example_V3.3.fas");


###################################################
### code chunk number 166: PhyloSim.Rnw:1205-1206
###################################################
rm(PSIM_FAST);


###################################################
### code chunk number 167: PhyloSim.Rnw:1240-1241
###################################################
PSIM_FAST<-TRUE;


###################################################
### code chunk number 168: PhyloSim.Rnw:1247-1248
###################################################
part<-list();


###################################################
### code chunk number 169: PhyloSim.Rnw:1252-1280
###################################################
part$nc1<-list(
		"type"="noncoding",
		"len"=1000,
		"subst"=NA,
		"ins"=NA,
		"del"=NA,
		"gamma.shape"=0.5
	);

part$nc1$subst<-GTR(
        rate.params=list(
                "a"=1, "b"=2, "c"=3,
                "d"=1, "e"=2, "f"=3
        ),
        base.freqs=c(1.5,1,1.5,1)/5
)

part$nc1$ins<-DiscreteInsertor(
	rate=0.025,sizes=1:6,
	probs=6:1/21,
	template.seq=NucleotideSequence(string="CCCCCC")
);

part$nc1$del<-DiscreteDeletor(
        rate=0.025,
        sizes=1:6,
        probs=6:1/21
);


###################################################
### code chunk number 170: PhyloSim.Rnw:1285-1294
###################################################
part$e1<-list(
		"type"="first.exon",
		"len"=400,
		"subst"=NA,
		"ins"=NA,
		"del"=NA,
		"omegas"=c(0,1,1.1),
		"omega.probs"=c(4,2,1)/5
	);


###################################################
### code chunk number 171: PhyloSim.Rnw:1298-1320
###################################################
part$e1$subst<-GY94(kappa=2,scale.nuc=TRUE);

part$e1$ins<-DiscreteInsertor(
        rate=0.025,
        sizes=1:2,
        probs=c(2/3,1/3),
        template.seq=CodonSequence(length=2,processes=list(list(part$e1$subst)))
);


part$e1$del<-DiscreteDeletor(
        rate=0.025,
        sizes=1:2,
        probs=c(2/3,1/3)
);


f84<-F84();
f84$kappa<-1.8;

gy94.e2_5<-clone(part$e1$subst);
gy94.e2_5$kappa<-1.5


###################################################
### code chunk number 172: PhyloSim.Rnw:1324-1357
###################################################
del.introns<-DiscreteDeletor(
        rate=0.025,
	sizes=1:8,
        probs=8:1/36
);

ins.introns<-DiscreteInsertor(
        rate=0.025,
        sizes=1:8,
        probs=8:1/36,
        template.seq=NucleotideSequence(length=8,processes=list(list(f84)))
);

for(i in 1:4){
	part[[paste("i",i,sep="")]]<-list(
		"type"="intron",
		"len"=200,
		"subst"=f84,
		"ins"=ins.introns,
		"del"=del.introns,
		"gamma.shape"=abs(rnorm(1,mean=1,sd=0.2))
	)
	part[[paste("e",i+1,sep="")]]<-list(
		"type"="exon",
		"len"=200,
		"subst"=gy94.e2_5,
		"ins"=NA,
		"del"=NA,
		"omegas"=c(0,0.5),
		"omega.probs"=c(3/4,1/4)
	)

}


###################################################
### code chunk number 173: PhyloSim.Rnw:1361-1370
###################################################
part$i5<-list(
		"type"="intron",
                "len"=200,
                "subst"=f84,
                "ins"=ins.introns,
                "del"=del.introns,
                "gamma.shape"=abs(rnorm(1,mean=1,sd=0.1))
)
rm(f84,gy94.e2_5,del.introns,ins.introns);


###################################################
### code chunk number 174: PhyloSim.Rnw:1374-1400
###################################################
part$e6<-list(
		"type"="last.exon",
		"len"=400,
		"subst"=NA,
		"ins"=NA,
		"del"=NA,
		"omegas"=c(0,1,1.1),
		"omega.probs"=c(4,2,1)/5
);

tmp<-clone(part$e1$subst);
tmp$kappa<-0.5;
part$e6$subst<-tmp;

part$e6$del<-DiscreteDeletor(
        rate=0.025,
        sizes=1:4,
        probs=c(4,3,2,1)/10
);

part$e6$ins<-DiscreteInsertor(
        rate=0.025,
        sizes=1:2,
        probs=c(1/3,2/3),
        template.seq=CodonSequence(length=2,processes=list(list(part$e6$subst)))
);


###################################################
### code chunk number 175: PhyloSim.Rnw:1404-1412
###################################################
part$nc2<-list(
		"type"="noncoding",
		"len"=1400,
		"subst"=K80(rate.params=list(Alpha = 2, Beta = 1)),
		"ins"=NA,
		"del"=NA,
		"gamma.shape"=0.5
	);


###################################################
### code chunk number 176: PhyloSim.Rnw:1417-1418
###################################################
s<-Sequence(length=5000);


###################################################
### code chunk number 177: PhyloSim.Rnw:1422-1424
###################################################
nuc<-NucleotideAlphabet();
cod<-CodonAlphabet();


###################################################
### code chunk number 178: PhyloSim.Rnw:1428-1429
###################################################
stop.alphabet<-Alphabet(symbols=c("TAG","TAA","TGA"));


###################################################
### code chunk number 179: PhyloSim.Rnw:1433-1444
###################################################
stop.subst<-GeneralSubstitution(
		alphabet=stop.alphabet,
		rate.list=list(
				"TAG->TAA"=1,
				"TAG->TGA"=2,
				"TAA->TAG"=3,
				"TAA->TGA"=1,
				"TGA->TAG"=2,
				"TGA->TAA"=3
			)
		);


###################################################
### code chunk number 180: PhyloSim.Rnw:1448-1449
###################################################
plot(stop.subst,scale=0.5);


###################################################
### code chunk number 181: PhyloSim.Rnw:1455-1518
###################################################
pos<-0;
for(i in part){
	beg<-pos+1;	
	end<-pos+i$len;	
	range<-beg:end;


	if( (i$type=="noncoding") | (i$type=="intron") ){
		setAlphabets(s,list(nuc),range);
	}
	else {
		setAlphabets(s,list(cod),range);
	}
	
	if(!is.na(i$del)){
		attachProcess(s,i$del,range);
	}
	if(!is.na(i$ins)){
		attachProcess(s,i$ins,range);
	}

	if( (i$type=="noncoding") | (i$type=="intron")){
		attachProcess(s,i$subst,range);

		plusInvGamma(this=s,process=i$subst,pinv=0.6,shape=i$gamma.shape,range);
		if(i$type=="intron"){
			# fix splicing sites
			setStates(s,c("G","T","A","G"),c(beg,beg+1,end-1,end));
			setRateMultipliers(s,i$subst,0,c(beg,beg+1,end-1,end));
			setInsertionTolerance(s,i$ins,0,c(beg,beg+1,end-1,end));
			setDeletionTolerance(s,i$del,0,c(beg,beg+1,end-1,end));
		}
	} 
	else if(i$type=="exon"){
		attachProcess(s,i$subst,range);

		omegaVarM3.CodonSequence(s,i$subst,i$omegas,i$omega.probs,range);
	}
	if(i$type=="first.exon"){
		attachProcess(s,i$subst,range);
		# Fix start codon:
		setStates(s,"ATG",beg);
		setRateMultipliers(s,i$subst,0,beg)
		setInsertionTolerance(s,i$ins,0,beg);
		setDeletionTolerance(s,i$del,0,beg);
	}
	if(i$type=="last.exon"){
		attachProcess(s,i$subst,range);
		# Detach GY94 from last site:
		detachProcess(s,i$subst,end);
		# Replace alphabet:
		setAlphabets(s,list(stop.alphabet),end);
		# Attach stop codon process:
		attachProcess(s,stop.subst,end);
		# Sample stop codon:
		sampleStates(s,end);
		# Protect against indels:
		setInsertionTolerance(s,i$ins,0,end);
		setDeletionTolerance(s,i$del,0,end);
	}
	
	pos<-end;
}


###################################################
### code chunk number 182: PhyloSim.Rnw:1523-1524
###################################################
sampleStates(s);


###################################################
### code chunk number 183: PhyloSim.Rnw:1528-1529
###################################################
sim<-PhyloSim(root.seq=s, phylo=rcoal(3));


###################################################
### code chunk number 184: PhyloSim.Rnw:1533-1534
###################################################
scaleTree(sim,0.15/sim$treeLength);


###################################################
### code chunk number 185: PhyloSim.Rnw:1538-1539
###################################################
Simulate(sim)


###################################################
### code chunk number 186: PhyloSim.Rnw:1543-1544
###################################################
plot(sim,num.pages="auto",plot.ancestors=FALSE)


###################################################
### code chunk number 187: PhyloSim.Rnw:1548-1549
###################################################
saveAlignment(sim,file="example_V3.4.fas");


###################################################
### code chunk number 188: PhyloSim.Rnw:1551-1552
###################################################
file.remove("example_V3.4.fas");


###################################################
### code chunk number 189: PhyloSim.Rnw:1556-1557
###################################################
rm(PSIM_FAST)


