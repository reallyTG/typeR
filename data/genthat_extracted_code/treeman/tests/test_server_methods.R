# LIBS
library(treeman)
library(testthat)

# DATA
test.lineages <- 
  list (c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusA',
           'speciesA'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusA',
           'speciesB'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusA',
           'speciesC'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusA',
           'speciesD'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusB',
           'speciesE'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusB',
           'speciesF'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyA', 'genusC',
           'speciesG'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyB', 'genusD',
           'speciesH'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderA', 'familyC', 'genusE',
           'speciesI'),
        c ('kingdomA', 'phylumA', 'classA',
           'orderB', 'familyD', 'genusF',
           'speciesJ'))

# RUNNING
context('Testing \'server-methods\'')
test_that ('.safeFromJSON([basic]) works', {
  # simply show that a warning is thrown and handled
  expect_warning(treeman:::.safeFromJSON(url='dummyaddress', max_trys=0))
})
test_that ('taxaResolve([basic]) works', {
  test_names <- c("Macaca mulatta", "Gorilla gorilla", "Homo sapiens", "Pan paniscus",
                  "Pan troglodytes", "Pongo pygmaeus", "Hylobates agilis",
                  "Hylobates lar", "Hylobates moloch", "Hylobates muelleri", 
                  "Hylobates pileatus", "Hylobates klossii", "Hylobates hoolock",
                  "Hylobates syndactylus", "Hylobates concolor", "Hylobates leucogenys",
                  "Hylobates gabriellae", 'thisisnotaname')
  expected_dimensions <- c (17, 10)
  res <- taxaResolve(test_names)
  res <- res[complete.cases(res), ]
  expect_that(dim(res), equals(expected_dimensions))
})
test_that ('searchTxnyms([basic]) works', {
  tree <- unblncdTree(8)
  new_tids <- c("Pan_trogoldytes", "Gallus_gallus", "Ailurus_fulgens",
                "Aileuropoda_melanoleucha","Rattus_rattus", "Mus_musculus",
                "Gorilla_gorilla", "Homo_sapiens")
  tree <- setNdsID(tree, tree['tips'], new_tids)
  nd_labels <- searchTxnyms(tree, cache=TRUE)
  expect_that(sum(is.na(nd_labels)), equals(0))
  # test infer arg
  prid_age <- getNdAge(tree, getNdSlt(tree, 'prid', 'Homo_sapiens'),
                       getAge(tree))
  tree <- addTip(tree, tid='Unknown_homo_sp', sid='Homo_sapiens',
         strt_age = runif(max=prid_age, min=0, n=1),
         tree_age = getAge(tree))
  nd_labels <- searchTxnyms(tree, cache=TRUE, infer=TRUE)
  expect_true(nd_labels[['p_Unknown_homo_sp']] == 'Homininae')
})
test_that ('.findClade([basic]) works', {
  # class A is shared by all test species
  expect_that (treeman:::.findClade (
    test.lineages), equals ('classA'))
})
if(dir.exists('gnr_cache')) {
  unlink('gnr_cache', recursive=TRUE)
}