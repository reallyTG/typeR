suppressMessages(library(rENA, quietly = T, verbose = F))
context("Test accumulating data file");


test_that("Simple data.frame to accumulate", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  df.accum = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"));
  df.accum.weighted = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"), weight.by = "weighted");

  # testthat::expect_true(all(
  #   as.matrix(df.accum$adjacency.vectors[, attr(df.accum$adjacency.vectors,"adjacency.codes"), with=F])
  #     ==
  #   #matrix(c(2,2,2,0,1,0), nrow=length(unique(df.accum$units)))
  #     matrix(c(2,2,2,0,1,0), nrow=2)
  # ));
});
test_that("Accumulate using conversation model", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  df.accum = ena.accumulate.data.file(
    df,
    units.by = c("Name"),
    conversations.by = c("Day"),
    #weight.by = function(x) { return(x) },
    codes = c("c1","c2","c3"),
    window = "Conversation"
  );

  # Check co-occurrences for unit `J` in conversation `1`
  expected.sums = colSums(df[df$Name=="J"&df$Day==1,df.accum$codes]);
  expected.sums[expected.sums > 1] = 1
  expected = tcrossprod(expected.sums);
  expected.co = expected[upper.tri(expected)]
  actual.co = as.numeric(df.accum$accumulated.adjacency.vectors[ENA_UNIT=="J"&Day==1,grep("^adj",colnames(df.accum$accumulated.adjacency.vectors)),with=F])
  testthat::expect_equal(
    label = "Verify the co-occurences for unit J in conversation 1",
    object=actual.co,
    expected=expected.co
  )
})
test_that("Accumulate weighted data.", {
  testdata = runif(24, 0, 1)
  testmat = matrix(testdata, 4, dimnames=list(NULL,LETTERS[1:6]))
  testmeta = data.frame(tr=1:4, unit=rep(1, 4))
  testdf = cbind(testmeta, testmat)

  x = ena.accumulate.data.file(testdf,
                               units.by='unit',
                               conversations.by='tr',
                               #units='1',
                               codes=LETTERS[1:6],
                               window.size.back=4,
                               weight.by = "weighted")

  testthat::expect_true(all(
    apply(x$adjacency.vectors[,grep("^adj",colnames(x$adjacency.vectors)), with=F], 2, is.double)
  ))
})
test_that("Corrected adjacency.vectors equals manually corrected raw data (correction = log)", {
  testdata = runif(24, 0, 1)
  testmat = matrix(testdata, 4, dimnames=list(NULL,LETTERS[1:6]))
  testmeta = data.frame(tr=1:4, unit=rep(1, 4))
  testdf = cbind(testmeta, testmat)

  x = ena.accumulate.data.file(testdf,
                               units.by='unit',
                               conversations.by='tr',
                               #units='1',
                               codes=LETTERS[1:6],
                               window.size.back=4,
                               weight.by = log)
  #binary=F,
  #correction = log)

  xtest = x$adjacency.vectors.raw;

  cols = colnames(xtest)[grep("adjacency.code", colnames(xtest))];
  xtest[, (cols) := lapply(.SD, log), .SDcols = cols];

  all.equal(x$adjacency.vectors, xtest[,grep("^adjacency", colnames(xtest)), with=F]);
})
test_that("Simple forwarded metadata", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    m1=c(1,2),
    m2=c(1,2,3,4)
  );

  df.accum = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"));

  testthat::expect_true("m1" %in% colnames(df.accum$metadata));
});
test_that("Test trajectories", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,0,0,0,0,1),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)
  );

  df.accum = ena.accumulate.data.file(
    df, units.by = c("Name"), conversations.by = c("Day", "ActivityNumber"), codes = c("c1","c2","c3"),
    model = "AccumulatedTrajectory"
  );
  df.non.accum = ena.accumulate.data.file(
    df, units.by = c("Name"), conversations.by = c("Day", "ActivityNumber"), codes = c("c1","c2","c3"),
    model = "SeparateTrajectory"
  );

  # Test for expected accumulated value
  testthat::expect_equal(df.accum$adjacency.vectors[df.accum$units$Name == "J" & df.accum$units$ActivityNumber == 3, adjacency.code.1],df.accum$accumulated.adjacency.vectors[Name == "J", sum(adjacency.code.1)]);

  # Test for a value of 1 in the first accumulation of the trajectory of code 1
  testthat::expect_true(sum(df.accum$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 1, adjacency.code.1]) == 1);
  # Test for a value of 0 in the second accumulation of the trajectory of code 1
  testthat::expect_true(all(df.accum$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 2, adjacency.code.1] == 0));

  # Test that the first summed trajectory is 1
  testthat::expect_equal(df.accum$adjacency.vectors[df.accum$units$Name == "Z" & df.accum$units$ActivityNumber == 1, adjacency.code.1], 1);

  # Test that the second summed trajectory is 1, even thought it had a zero accumulation for it's conversations
  testthat::expect_true(all(df.accum$adjacency.vectors[df.accum$units$Name == "J" & df.accum$units$ActivityNumber==3,] == c(2,2,1)));

  # Test that non-accumulation is properly leaving second trajectory group 0 (different than the previous test)
  testthat::expect_true(all(df.non.accum$adjacency.vectors[df.non.accum$units$Name == "J" & df.non.accum$units$ActivityNumber==3,] == c(0,0,0)));
})
test_that("Test accumulation with data.frame and matrix", {
  # #df.file <- system.file("extdata", "rs.data.csv", package="rENA")
  #
  # codeNames = c('Data','Technical.Constraints','Performance.Parameters','Client.and.Consultant.Requests','Design.Reasoning','Collaboration');
  # df.csv = RS.data; # read.csv(df.file)
  #
  # df.accum = ena.accumulate.data.file(df.csv, units.by = c("UserName","Condition"), conversations.by = c("ActivityNumber","GroupName"), codes = codeNames);
  # df.accum2 = ena.accumulate.data.file(df.file, units.by = c("UserName","Condition"), conversations.by = c("ActivityNumber","GroupName"), codes = codeNames);
  #
  # testthat::expect_is(df.csv, "data.frame")
  # testthat::expect_is(df.accum, "ENAdata")
  # testthat::expect_is(df.accum2, "ENAdata")
  #
  # ## Test with file reported in #5
  # pn.file <- system.file("extdata", "sample-data", "PinterestMock2.csv", package="rENA")
  # pn.csv = read.csv(pn.file)
  # pn.accum = ena.accumulate.data.file(pn.csv, units.by =  c("Teacher"), conversations.by = c("Board"), codes = c("Kinesthetic", "Algorithmic"))
  #
  # testthat::expect_is(pn.accum, "ENAdata")
})
test_that("Test accumulation with dplyr::tbl_df", {
  # pn.file = system.file("extdata", "sample-data", "PinterestMock2.csv", package="rENA")
  # PinterestMock2 <- readr::read_csv(pn.file)
  # pn.accum = ena.accumulate.data.file(PinterestMock2, units.by =  c("Teacher"), conversations.by = c("Board"), codes = c("Kinesthetic", "Algorithmic"))
  #
  # testthat::expect_is(pn.accum, "ENAdata")
})

# test_that("Test accumulation output JSON", {
#   pn.file = system.file("extdata", "sample-data", "PinterestMock2.csv", package="rENA")
#   pn.accum = ena.accumulate.data.file(pn.file, units.by =  c("Teacher"), conversations.by = c("Board"), codes = c("Kinesthetic", "Algorithmic"), output = "json")
#
#   pn.accum.less = ena.accumulate.data.file(pn.file, units.by =  c("Teacher"), conversations.by = c("Board"), codes = c("Kinesthetic", "Algorithmic"), output = "json", output.fields = c("metadata"))
#
#   testthat::expect_is(pn.accum, "list")
#   testthat::expect_is(pn.accum$accumulated.adjacency.vectors, "data.frame")
#   testthat::expect_is(pn.accum.less, "list")
#   testthat::expect_null(pn.accum.less$accumulated.adjacency.vectors)
# })
