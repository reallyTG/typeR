expect_error(
	{
	seqkat(5, 3.2, 4, bed.file = "test.bed")
		},
	"The bed.file provided does not exist.",
	info = "seqkat Error 1"
	);
