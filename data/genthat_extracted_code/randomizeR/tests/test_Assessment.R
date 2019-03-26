###################################################################
# ----------------------------------------------------------------#
# Tests for the assess function                                   #
# ----------------------------------------------------------------#
###################################################################

context("Assessment")

test_that("assess returns valid object", {
	seqs <- getAllSeq(pbrPar(bc = c(2, 2, 2)))
		
	type <- sample(c("CS", "DS"), 1)
	i1 <- corGuess(type)
	method <- sample(c("sim", "exact"), 1)
	i2 <- selBias(type, 1, method)
	# endp <- normEndp(c(0,0), c(1,1))
	expect_is(assess(seqs, i1), "assessment")
	expect_is(assess(seqs, i1, i2, endp = normEndp(c(0,0), c(1,1))), "assessment")
	
	type <- sample(c("imb", "absImb", "loss", "maxImb"),1)
	i3 <- imbal(type)
	expect_is(assess(seqs, i3), "assessment")

	expect_error(assess(seqs))
	expect_error(assess(seqs, "blubb"))
	expect_error(assess(seqs, "issue"))
	expect_error(assess(seqs, 42))
	
	
	#### Assessment object with Selection Bias for K>2
	seqs <- genSeq(crPar(12, 3), r = 1000)
	i4 <- selBias("CS", 0.5, "exact", 0.05)
	i5 <- selBias("CS", 0.5, "sim", 0.05)
	endp <- normEndp(c(0,0,0), c(1,1,1))
	expect_is(assess(seqs, i4, endp = endp), "assessment")
	expect_is(assess(seqs, i5, endp = endp), "assessment")
	expect_error(assess(seqs, i4, endp = normEndp(c(0,0), c(1,1))))
	expect_error(assess(seqs, i5, endp = normEndp(c(0,0), c(1,1))))
	expect_error(assess(seqs, selBias("DS", 0.5, "exact", 0.05),endp = endp))
	
	
	
	
	### A broad assessment test
	## some selection biases (one from every case)
	sbias1 <- selBias("CS", 0.5, "exact", 0.05)
	sbias2 <- selBias("CS", 0.5, "sim", 0.05)
	sbias3 <- selBias("DS", 0.5, "exact", 0.05)
	sbias4 <- selBias("DS", 0.5, "sim", 0.05)
	sbias5 <- selBias("CS2", 0.5, "exact", 0.05)
	sbias6 <- selBias("CS2", 0.5, "sim", 0.05)
	sbias_list <- list(sbias1, sbias2, sbias3, sbias4, sbias5, sbias6)
	
	## some chronological biases (one from every case)
	cbias1 <- chronBias(type = "linT", theta = 0.25, method = "exact", saltus = 3, alpha = 0.05)
	cbias2 <- chronBias(type = "linT", theta = 0.25, method = "sim", saltus = 3, alpha = 0.05)
	cbias3 <- chronBias(type = "logT", theta = 0.25, method = "exact", saltus = 3, alpha = 0.05)
	cbias4 <- chronBias(type = "logT", theta = 0.25, method = "sim", saltus = 3, alpha = 0.05)
	cbias5 <- chronBias(type = "stepT", theta = 0.25, method = "exact", saltus = 3, alpha = 0.05)
	cbias6 <- chronBias(type = "stepT", theta = 0.25, method = "sim", saltus = 3, alpha = 0.05)
	cbias_list <- list(cbias1, cbias2, cbias3, cbias4, cbias5, cbias6)
	
	## some combined biases (every combination that makes sense)
	combias_list <- list(combineBias(sbias1, cbias1), combineBias(sbias1, cbias3), combineBias(sbias1, cbias5), 
	                     combineBias(sbias2, cbias2), combineBias(sbias2, cbias4), combineBias(sbias2, cbias6),
	                     combineBias(sbias5, cbias1), combineBias(sbias5, cbias3), combineBias(sbias5, cbias5),
	                     combineBias(sbias6, cbias2), combineBias(sbias6, cbias4), combineBias(sbias6, cbias6))
	
	## some sequences and endpoints defined
	seqs_2k <- list(genSeq(rarPar(10)), genSeq(rarPar(10), r = 100), getAllSeq(rarPar(10)))
	seqs_3k <- list(genSeq(rarPar(12,3)), genSeq(rarPar(12,3), r = 100))
	
	endp1 <- normEndp(c(0,0), c(1,1))
	endp2 <- normEndp(c(0,0,0), c(1,1,1))
	
	
	seq <- seqs_2k[[sample(1:3, 1)]]
	i <- sample(1:6, 1)
  expect_is(assess(seq, cbias_list[[i]], endp = endp1), "assessment")
  expect_is(assess(seq, sbias_list[[i]], endp = endp1), "assessment")
  expect_is(assess(seq, combias_list[[i*2]], endp = endp1), "assessment")
  
  seq <- seqs_3k[[sample(1:2, 1)]]
  i <- sample(1:6, 1)
  expect_is(assess(seq, cbias_list[[i]], endp = endp2), "assessment")
  expect_is(assess(seq, sbias_list[[sample(c(1,2,5,6), 1)]], endp = endp2), "assessment")
  expect_is(assess(seq, combias_list[[i*2]], endp = endp2), "assessment")
	
	
})

test_that("issues are computed right", {
  RP1 <- getAllSeq(pbrPar(bc = c(2, 2, 2, 2)))
  RP2 <- getAllSeq(bsdPar(10, 1))
  RP3 <- genSeq(rpbrPar(N = 8, rb = 2), r = 100)
  RP4 <- getAllSeq(mpPar(10,1))
  i1 <- corGuess("CS")
  i2 <- corGuess("DS")
  i3 <- imbal("imb")
  i4<- imbal("absImb")
  i5 <- imbal("loss")
  i6 <- imbal("maxImb")
  
  # test for all RPs if issues are calculated exact
  for (RP in c("RP1", "RP2", "RP3", "RP4")) {
    RP <- eval(parse(text = RP[1]))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,3] == 0.75))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,4] == 0.25))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,5] == 0))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,6] == 0))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,7] == 0))
    expect_true(all(assess(RP, i1, i2, i3, i4, i5, i6)@D[,8] == 1))
  }  
})