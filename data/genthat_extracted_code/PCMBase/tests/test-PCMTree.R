library(testthat)
context("PCMTree")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  list2env(PCMBaseTestObjects, globalenv())

  library(ape)


  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")
  # number of tips
  N <- 40

  # tree with one regime
  PCMTreeSetPartRegimes(tree.a, part.regime = c(`41` = "a"))
  #PCMTreePlot(tree.a)

  test_that(
    "Tree with 40 tips and one regime", {
      expect_identical(PCMTreeGetParent(tree.a, 71L), 52L)
      expect_identical(PCMTreeGetLabels(tree.a)[52L], "52")
      expect_identical(PCMTreeGetPartsForNodes(tree.a, "71"), c("41"))
      expect_identical(PCMTreeNumParts(tree.a), 1L)
      expect_identical(PCMTreeGetPartition(tree.a), c(`41` = 41L))
    })

  tree.ab <- tree.a
  PCMTreeSetPartRegimes(
    tree.ab, part.regime = c(`41` = "a", `71` = "b"), setPartition = TRUE)
  #PCMTreePlot(tree.ab)

  test_that(
    "Tree with 40 tips and two regimes", {
      expect_identical(PCMTreeGetParent(tree.ab, 71L), 52L)
      expect_identical(PCMTreeGetLabels(tree.ab)[52L], "52")
      expect_identical(PCMTreeGetPartsForNodes(tree.ab, "71"), "71")
      expect_identical(PCMTreeGetPartition(tree.ab), c(`41` = 41L, `71` = 71L))
    })


  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  test_that("PCMTreeNodeTimes", {
    expect_equivalent(
      PCMTreeNodeTimes(tree_15_tips),
      c(0.666725094430149, 1.03572271834128, 1.47726051113568, 1.61899162991904, 2.10669805249199, 3.57368590473197, 3.26124938833527, 3.56297762691975, 2.59485166589729, 1.87603989476338, 2.49500915128738, 2.94890801399015, 2.41463545593433, 2.32295331568457, 2.70654317038134, 0, 0.267220668727532, 0.653334761271253, 1.136911514448, 0.599565825425088, 1.09310713247396, 1.27932473388501, 1.94779147207737, 2.74203133280389, 2.84997495869175, 1.15260213706642, 1.68232171726413, 2.47167794895358, 1.84533369354904))
  })

  PCMTreeSetLabels(tree_15_tips)

  # par(mfrow=c(2, 3))
  # plot(tree_15_tips); nodelabels(text=tree_15_tips$node.label)

  tree1 <- PCMTreeEvalNestedEDxOnTree("E(tree, 20)", tree_15_tips)
  # plot(tree1); nodelabels(text=tree1$node.label)
  test_that("Test PCMTreeEvalNestedEDxOnTree 1: E(tree, 20)", {
    expect_identical(PCMTreeGetLabels(tree1)[PCMTreeNumTips(tree1) + 1], "20")
  })

  tree2 <- PCMTreeEvalNestedEDxOnTree("E(E(tree, 20),28)", tree_15_tips)
  # plot(tree2); nodelabels(text=tree2$node.label)
  test_that("Test PCMTreeEvalNestedEDxOnTree 2: E(E(tree, 20),28)", {
    expect_identical(PCMTreeGetLabels(tree2)[PCMTreeNumTips(tree2) + 1], "28")
  })

  tree3 <- PCMTreeEvalNestedEDxOnTree("E(D(tree,27),29)", tree_15_tips)
  #plot(tree3); nodelabels(text=tree3$node.label)
  test_that("Test PCMTreeEvalNestedEDxOnTree 3: E(D(tree,27),29)", {
    expect_identical(PCMTreeGetLabels(tree3)[PCMTreeNumTips(tree3) + 1], "29")
  })

  tree4 <- PCMTreeEvalNestedEDxOnTree("D(D(D(E(tree,22),17),26),25)", tree_15_tips)
  # plot(tree4); nodelabels(text = tree4$node.label)
  test_that("Test PCMTreeEvalNestedEDxOnTree 4: D(D(D(E(tree,22),17),26),25)", {
    expect_identical(PCMTreeGetLabels(tree4)[PCMTreeNumTips(tree4) + 1], "22")
    expect_error(PCMTreeGetParent(tree4, "8"))
    expect_identical(PCMTreeGetParent(tree4, PCMTreeMatchLabels(tree4, "8")), PCMTreeMatchLabels(tree4, "24"))
    expect_identical(PCMTreeGetParent(tree4, PCMTreeMatchLabels(tree4, "24")), PCMTreeMatchLabels(tree4, "23"))
  })

  #tree5 <- PCMTreeEvalNestedEDxOnTree("D(D(D(E(tree,20),22),10),27)", tree_15_tips)
  #plot(tree5); nodelabels(text = tree5$node.label)

  #tree6 <- PCMTreeEvalNestedEDxOnTree("D(tree,1)", tree_15_tips)
  #plot(tree6); nodelabels(text = tree6$node.label)

  test_that(
    "PCMTreeListCladePartitions with nNodes=1L returns correct number of nodes",
    expect_identical(
      unlist(PCMTreeListCladePartitions(tree_15_tips, 1L, minCladeSize = 3)),
      as.integer(c(17, 20, 21, 22, 23, 24, 26, 27)))
  )


  tree20 <- PCMTreeEvalNestedEDxOnTree("E(tree,20)", tree_15_tips)

  tableAnc <- PCMTreeTableAncestors(tree_15_tips)

  PCMTreeGetLabels(tree20)[unlist(PCMTreeListCladePartitions(tree20, 1, 3))]

  tree_20 <- PCMTreeEvalNestedEDxOnTree("D(tree,20)", tree_15_tips)

  tree26 <- PCMTreeEvalNestedEDxOnTree("E(tree,26)", tree20)

  tree23 <- PCMTreeEvalNestedEDxOnTree("E(tree,23)", tree_15_tips)

  tree21 <- PCMTreeEvalNestedEDxOnTree("E(tree,21)", tree_15_tips)

  spl <- PCMTreeSplitAtNode(tree_15_tips, "20", tableAnc)

  r <- PCMTreeListAllPartitions(tree = tree20, minCladeSize = 3, verbose = FALSE)

  test_that("PCMTreeListAllClades returns 12 partitions",
            expect_equal(length(r), 12L)
            )
}
