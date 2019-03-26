suppressMessages(library(rENA, quietly = T, verbose = F))
context("Test functions accumulating data: from separate data frames VS from csv/single df");

test_that("Simple Accumulation from separate data.frames VS from single data frame", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  ###NOTE - commented out values not accumulated by in test below (from file)
  df.units = data.frame(
    Name=rep(c("J","Z"), 6)
    #Group=c(1,1,1,1,2,2,2,3,3,3,4,4)
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2)#,
    #ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)#,
    #c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );
  df.whole = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  df.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes);
  df.accum.weighted.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes);

  # df.accum.whole = ena.accumulate.data.file(df.whole, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"));
  # df.accum.weighted.whole = ena.accumulate.data.file(df.whole, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"), weight.by = "weighted");

  ### expect results equivalent from each version
  # expect_equal(df.accum.sep$adjacency.vectors,df.accum.whole$adjacency.vectors)
  # expect_equal(df.accum.weighted.sep$adjacency.vectors, df.accum.weighted.whole$adjacency.vectors);

  # expect_true(all(
  #   as.matrix(df.accum.sep$adjacency.vectors[, attr(df.accum.sep$adjacency.vectors,"adjacency.codes"), with=F])
  #   ==
  #     matrix(c(c(2,2,2), c(0,1,0)), nrow=2)
  # ));
  # expect_true(all(
  #   as.matrix(df.accum.whole$adjacency.vectors[, attr(df.accum.whole$adjacency.vectors,"adjacency.codes"), with=F])
  #   ==
  #     matrix(c(c(2,2,2), c(0,1,0)), nrow=2)
  # ));
})

test_that("Simple forwarded metadata", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df.units = data.frame(
    Name=rep(c("J","Z"), 6)
    #Group=c(1,1,1,1,2,2,2,3,3,3,4,4)
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2)#,
    #ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)#,
    #c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );
  df.meta = data.frame(
    m1=c(1,2,1,2,1,2,1,2,1,2,1,2),
    m2=c(1,2,3,4,9,9,9,9,9,9,9,9)
  )
  df = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    m1=c(1,2,1,2,1,2,1,2,1,2,1,2),
    m2=c(1,2,3,4,9,9,9,9,9,9,9,9)
  );

  # df.accum = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day"), codes = c("c1","c2","c3"));
  df.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes, metadata = df.meta)

  # expect_true("m1" %in% colnames(df.accum$metadata));
  expect_true("m1" %in% colnames(df.accum.sep$metadata));
  # expect_equal(df.accum$metadata, df.accum.sep$metadata);
});

test_that("Test trajectories", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df.units = data.frame(
    Name=rep(c("J","Z"), 6)
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,0,0,0,0,1),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)
  );
  df = data.frame(
    Name=c("J","Z"),
    #Name=rep(c("J","Z"), 6),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,0,0,0,0,1),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)
  );

  df.accum = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day", "ActivityNumber"),
    codes = c("c1","c2","c3"), model = "AccumulatedTrajectory"
  );
  df.non.accum = ena.accumulate.data.file(df, units.by = c("Name"), conversations.by = c("Day", "ActivityNumber"),
    codes = c("c1","c2","c3"), model = "SeparateTrajectory"
  );
  df.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation,
    codes = df.codes, model = "AccumulatedTrajectory"
  );
  df.non.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation,
    codes = df.codes, model = "SeparateTrajectory"
  );

  # Test for expected accumulated value
  testthat::expect_equal(
    df.accum$adjacency.vectors[df.accum$units$Name=="J" & df.accum$units$ActivityNumber == 3, adjacency.code.1],
    df.accum$accumulated.adjacency.vectors[Name == "J", sum(adjacency.code.1)]
  );
  testthat::expect_equal(
    df.accum.sep$adjacency.vectors[df.accum$units$Name=="J" & df.accum$units$ActivityNumber == 3, adjacency.code.1],
    df.accum.sep$accumulated.adjacency.vectors[Name == "J", sum(adjacency.code.1)]
  );

  # Test for a value of 1 in the first accumulation of the trajectory of code 1
  testthat::expect_true(sum(df.accum$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 1, adjacency.code.1]) == 1);
  testthat::expect_true(sum(df.accum.sep$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 1, adjacency.code.1]) == 1);

  # Test for a value of 0 in the second accumulation of the trajectory of code 1
  testthat::expect_true(all(df.accum$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 2, adjacency.code.1] == 0));
  testthat::expect_true(all(df.accum.sep$accumulated.adjacency.vectors[Name == "Z" & ActivityNumber == 2, adjacency.code.1] == 0));

  # Test that the first summed trajectory is 1
  testthat::expect_equal(df.accum$adjacency.vectors[df.accum$units$Name=="Z" & df.accum$units$ActivityNumber == 1, adjacency.code.1], 1);
  testthat::expect_equal(df.accum.sep$adjacency.vectors[df.accum$units$Name=="Z" & df.accum$units$ActivityNumber == 1, adjacency.code.1], 1);

  # Test that the second summed trajectory is 1, even thought it had a zero accumulation for it's conversations
  testthat::expect_equal(df.accum$adjacency.vectors[df.accum$units$Name == "Z" & df.accum$units$ActivityNumber == 2 & df.accum$units$Day == 1, adjacency.code.1], 1);
  testthat::expect_equal(df.accum.sep$adjacency.vectors[df.accum$units$Name == "Z" & df.accum$units$ActivityNumber == 2 & df.accum$units$Day == 1, adjacency.code.1], 1);

  # Test that non-accumulation is properly leaving second trajectory group 0 (different than the previous test)
  testthat::expect_identical(c(1,0,0,1), df.non.accum$adjacency.vectors[df.non.accum$units$Name == "Z", adjacency.code.1]);
  testthat::expect_identical(c(1,0,0,1), df.non.accum.sep$adjacency.vectors[df.non.accum$units$Name == "Z", adjacency.code.1]);
})


test_that("COPY OF FIRST TEST FOR units/unit.names/trajectories$ TESTING PURPOSES", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  df.units = data.frame(
    Name=rep(c("J","Z"), 6),
    #Day=c(1,1,1,1,1,1,2,2,2,2,2,2)#,
    Group=c("First","First","Second","Second","First","First","Second","Second","First","First","Second","Second")
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)#,
    #c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );
  df.whole = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3),
    Group=c("First","First","Second","Second","First","First","Second","Second","First","First","Second","Second"),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  df.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes, model = "A");
  df.accum.weighted.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes);

  df.accum.whole = ena.accumulate.data.file(df.whole, units.by = c("Name", "Group"), conversations.by = c("Day", "ActivityNumber"), codes = c("c1","c2","c3"), model = "A");
  df.accum.weighted.whole = ena.accumulate.data.file(df.whole, units.by = c("Name", "Group"), conversations.by = c("Day", "ActivityNumber"), codes = c("c1","c2","c3"), weight.by = "weighted");

  ### expect results equivalent from each version
  expect_equal(df.accum.sep$adjacency.vectors,df.accum.whole$adjacency.vectors)
  expect_equal(df.accum.weighted.sep$adjacency.vectors, df.accum.weighted.whole$adjacency.vectors);

})

test_that("Test accumulation with infinite windows", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  ###NOTE - commented out values not accumulated by in test below (from file)
  df.units = data.frame(
    Name=rep(c("J","Z"), 6)
    #Group=c(1,1,1,1,2,2,2,3,3,3,4,4)
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2)#,
    #ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)#,
    #c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );
  df.whole = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  df.accum.sep = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes);
  df.accum.inf = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes, window.size.back = Inf);
  df.accum.inf2 = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes, window.size.back = "Inf");
  df.accum.inf3 = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes, window.size.back = "INF");

  codeCols = sapply(1:choose(ncol(df.codes),2), function(x) { paste("adjacency.code.",x,sep="") })
  expect_false(all(df.accum.sep$accumulated.adjacency.vectors[,codeCols,with=F] == df.accum.inf$accumulated.adjacency.vectors[,codeCols,with=F]))
  expect_true(all(df.accum.inf$accumulated.adjacency.vectors[,codeCols,with=F] == df.accum.inf2$accumulated.adjacency.vectors[,codeCols,with=F]))
})

test_that("Test function params", {
  fake.codes.len = 10;
  fake.codes <- function(x) sample(0:1,fake.codes.len, replace=T)

  codes = paste("Codes",LETTERS[1:fake.codes.len],sep="-");

  ###NOTE - commented out values not accumulated by in test below (from file)
  df.units = data.frame(
    Name=rep(c("J","Z"), 6)
    #Group=c(1,1,1,1,2,2,2,3,3,3,4,4)
  );
  df.conversation = data.frame(
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2)#,
    #ActivityNumber=c(1,1,1,1,2,2,2,2,3,3,3,3)
  );
  df.codes = data.frame(
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0)#,
    #c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );
  df.whole = data.frame(
    Name=c("J","Z"),
    Day=c(1,1,1,1,1,1,2,2,2,2,2,2),
    c1=c(1,1,1,1,1,0,0,1,1,0,0,1),
    c2=c(1,1,1,0,0,1,0,1,0,1,0,0),
    c3=c(0,0,1,0,1,0,1,0,0,0,1,0),
    c4=c(1,1,1,0,0,1,0,1,0,1,0,0)
  );

  accum = ena.accumulate.data(units = df.units, conversation = df.conversation, codes = df.codes);
  expect_equal("EndPoint",accum$function.params$model)
})
